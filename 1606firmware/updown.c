#ifndef __AVR_ATtiny1606__
#define __AVR_ATtiny1606__
#endif


#define F_CPU 20000000UL
#include <inttypes.h>
#include <avr/io.h>
#include <util/delay.h>

#include "./chars.h"

#define LED_DATA	0x40
#define LED_ADDRESS	0xC0
#define LED_DISPLAY	0x80
#define DATA_CLOCK_US 10 //100 is a safe value

//0x00 - 0x0f
// #define BRIGHTNESS 0x00
#define BRIGHTNESS 0x0f

//Pins:
#define TM1637_CLK PIN4
#define TM1637_DIO PIN5



#define SOURCE_A_OUT_ADC ADC_MUXPOS_AIN1_gc
#define SOURCE_B_OUT_ADC ADC_MUXPOS_AIN2_gc
#define RESULT_ADC ADC_MUXPOS_AIN6_gc

#define DIGITS 6

#define DEBOUNCE_CYCLES 10

#define MAX_V 43
#define MIN_V 0

#define MAX(a,b) (a>b)?a:b
#define MIN(a,b) (a<b)?a:b
#define DIV_ROUND(a,b) (a + (b/2))/b

const unsigned char segmentOrder[6] PROGMEM = {2,3,5,4,1,0};

//Set the pinmode of TM1637_CLK and TM1637_DIO
//Output mode (1) has side effect of reducing impedance to GND and so drives the pin LOW
//Input mode (0) allows pin to be pulled HIGH by external resistors
static inline void SetTM1637_CLKTM1637_DIOMode(unsigned char TM1637_CLKMode, unsigned char TM1637_DIOMode){
	
	if(TM1637_CLKMode)
		PORTA_DIR &= ~(1 << TM1637_CLK);
	else
		PORTA_DIR |= (1 << TM1637_CLK);
	if(TM1637_DIOMode)
		PORTA_DIR &= ~(1 << TM1637_DIO);
	else
		PORTA_DIR |= (1 << TM1637_DIO);
	_delay_us(DATA_CLOCK_US);
}

//start and stop a TM1637 transaction around a block of code
#define txn(a) { \
	SetTM1637_CLKTM1637_DIOMode(1, 0); \
	a \
	SetTM1637_CLKTM1637_DIOMode(0,0);\
	SetTM1637_CLKTM1637_DIOMode(1,0);\
	SetTM1637_CLKTM1637_DIOMode(1,1);\
}

//Bang b out to the TM1637
void sendByte(unsigned char b){
	for(unsigned char i = 0; i < 8; i++) {
		SetTM1637_CLKTM1637_DIOMode(0,1);
		unsigned char bit = b & 0b00000001;
		SetTM1637_CLKTM1637_DIOMode(0,bit);
		SetTM1637_CLKTM1637_DIOMode(1,bit);
		b >>= 1;
	}
	SetTM1637_CLKTM1637_DIOMode(0,1);
	SetTM1637_CLKTM1637_DIOMode(1,1);
	SetTM1637_CLKTM1637_DIOMode(0,0);
}

//Assumes segs is DIGITS bytes long
void sendSegs(const unsigned char* segs){
	txn({
		sendByte(LED_ADDRESS);
		for(unsigned char i = 0; i < DIGITS; i++){
			// sendByte(segs[i]);
			sendByte(segs[pgm_read_byte(&segmentOrder[i])]);
		}
	});
}


void intToTwoSegs(int i, unsigned char* segs, int tenths){
	segs[1] 
		= pgm_read_byte(chars +'0' + (i%10));
	i /= 10;
	segs[0] 
		= pgm_read_byte(chars +'0' + (i%10))
		| (tenths ? pgm_read_byte(chars +'.') : 0);
}

unsigned char voltages[] = { 10, 10, 10 };
unsigned char debounceInputs[] = { 0, 0 }; //could have one global debounce

unsigned char segments[6];

void handleButtons(int i, unsigned char up_mask, unsigned char down_mask){
	if((PORTC_IN & up_mask) && (debounceInputs[i] == 0)){
		voltages[i] = MIN(MAX_V, voltages[i]+1);
		debounceInputs[i]=DEBOUNCE_CYCLES;
	}

	if((PORTC_IN & down_mask) && (debounceInputs[i] == 0)){
		voltages[i] = MAX(0, voltages[i]-1);
		debounceInputs[i]=DEBOUNCE_CYCLES;
	}

	debounceInputs[i] = MAX(0, debounceInputs[i]-1);
}

unsigned short adcRawCounts(unsigned char muxpos){
	ADC0_MUXPOS = muxpos;

	ADC0_COMMAND = 0x01;

	while(ADC0_COMMAND);

	return MIN(ADC0_RES, 0x03FF);
}

// where max voltage is in tenths:
// measured value / (max value / max voltage)
// = (measured value << 5) / ((max value <<  5) / max voltage)
// = (measured value << 5) / ((0x3FF << 5) / 43)
// ~= (measured value << 5) / 0x02F9

//TODO: calibration

#define ADC_CONVERSION_CONSTANT 0x02F9

unsigned short adcTenthsVolt(unsigned char muxpos){
	return DIV_ROUND((adcRawCounts(muxpos) << 5), ADC_CONVERSION_CONSTANT);
}

unsigned short tenthsVoltRawCount(unsigned short tenths){
	return (tenths * ADC_CONVERSION_CONSTANT) >> 6;
}

void main(){

	//General I/O setup
	PORTA_DIR = 0;
	PORTB_DIR = 0;
	PORTC_DIR = 0;

	//ADC setup:
	VREF_CTRLA = VREF_ADC0REFSEL_4V34_gc;
	
	ADC0_CTRLA = 0x00;
	ADC0_CTRLB = 0x00;
	ADC0_CTRLC = 0x00;
	ADC0_CTRLD = 0x00;// set this to ADC_ASDV_bm to randomise the samples a little
	ADC0_CTRLE = 0x00;

	//  Enable adc:
	ADC0_CTRLA = ADC_ENABLE_bm;

	SetTM1637_CLKTM1637_DIOMode(1,1);
	//Turn display on and set brightness
	txn({
		sendByte(LED_DATA);
	});
	txn({
		sendByte( LED_DISPLAY				//command
				| 0x08						//display is on
				| (BRIGHTNESS & 0x07)); 	//set brightness
	});

	while(1){
		voltages[2] = adcTenthsVolt(SOURCE_B_OUT_ADC);
		// voltages[2] = adcTenthsVolt(ADC_MUXPOS_AIN6_gc);

		for(int i = 0; i < 3; i++){
			intToTwoSegs(voltages[i], segments + (i*2), 1);
		}

		handleButtons(0, PIN0_bm, PIN1_bm);
		handleButtons(1, PIN2_bm, PIN3_bm);

		sendSegs(segments);
		// _delay_ms(25);
	}
}