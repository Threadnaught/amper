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
#define BRIGHTNESS 0x00
// #define BRIGHTNESS 0x0f

#define CLK PIN4
#define DIO PIN5

#define DIGITS 6

#define DEBOUNCE_CYCLES 10

#define MAX_V 43
#define MIN_V 0

#define MAX(a,b) (a>b)?a:b
#define MIN(a,b) (a<b)?a:b

const unsigned char segmentOrder[6] PROGMEM = {2,3,5,4,1,0};

//Set the pinmode of CLK and DIO
//Output mode (1) has side effect of reducing impedance to GND and so drives the pin LOW
//Input mode (0) allows pin to be pulled HIGH by external resistors
static inline void SetClkDioMode(unsigned char ClkMode, unsigned char DioMode){
	if(ClkMode)
		PORTA_DIR &= ~(1 << CLK);
	else
		PORTA_DIR |= (1 << CLK);
	if(DioMode)
		PORTA_DIR &= ~(1 << DIO);
	else
		PORTA_DIR |= (1 << DIO);
	_delay_us(DATA_CLOCK_US);
}

//start and stop a TM1637 transaction around a block of code
#define txn(a) { \
	SetClkDioMode(1, 0); \
	a \
	SetClkDioMode(0,0);\
	SetClkDioMode(1,0);\
	SetClkDioMode(1,1);\
}

//Bang b out to the TM1637
void sendByte(unsigned char b){
	for(unsigned char i = 0; i < 8; i++) {
		SetClkDioMode(0,1);
		unsigned char bit = b & 0b00000001;
		SetClkDioMode(0,bit);
		SetClkDioMode(1,bit);
		b >>= 1;
	}
	SetClkDioMode(0,1);
	SetClkDioMode(1,1);
	SetClkDioMode(0,0);
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

// unsigned char ascii[] = { 0x30+5, 0x31+5, 0x32+5, 0x33+5, 0x34+5, 0x35+5 };
unsigned char vals[] = { 10, 10, 10 };
unsigned char debounce[] = { 0, 0 }; //could have one global debounce

unsigned char segments[6];

void handleButtons(int i, unsigned char up_mask, unsigned char down_mask){
	if((PORTC_IN & up_mask) && (debounce[i] == 0)){
		vals[i] = MIN(MAX_V, vals[i]+1);
		debounce[i]=DEBOUNCE_CYCLES;
	}

	if((PORTC_IN & down_mask) && (debounce[i] == 0)){
		vals[i] = MAX(0, vals[i]-1);
		debounce[i]=DEBOUNCE_CYCLES;
	}

	debounce[i] = MAX(0, debounce[i]-1);
}

int divRound(int a, int b){
	int floor = a/b;
	int ceil = floor+1;

	if((a - (floor*b)) < ((ceil*b) - a)){
		return floor;
	}
	return ceil;
}

void main(){
	PORTA_DIR = 0;
	PORTB_DIR = 0;	
	PORTC_DIR = 0;

	VREF_CTRLA = VREF_ADC0REFSEL_4V34_gc;
	
	ADC0_CTRLA = 0x00;
	ADC0_CTRLB = 0x00;
	ADC0_CTRLC = 0x00;
	ADC0_CTRLD = 0x00;// set this to ADC_ASDV_bm to randomise the samples a little
	ADC0_CTRLE = 0x00;

	ADC0_MUXPOS = 0x06;


	//enable adc:
	ADC0_CTRLA = ADC_ENABLE_bm;

	

	SetClkDioMode(1,1);
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
		ADC0_COMMAND = 0x01;

		while(ADC0_COMMAND);

		vals[2] = divRound((10*ADC0_RES), 238); //(0x3FF / 43)
		// vals[2] = 43;

		for(int i = 0; i < 3; i++){
			intToTwoSegs(vals[i], segments + (i*2), 1);
		}

		handleButtons(0, PIN0_bm, PIN1_bm);
		handleButtons(1, PIN2_bm, PIN3_bm);

		sendSegs(segments);
		// _delay_ms(25);
	}
}