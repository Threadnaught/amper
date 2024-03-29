#ifndef __AVR_ATtiny1606__
#define __AVR_ATtiny1606__
#endif

#include "./chars.h"
#include "./constants.h"

#include <inttypes.h>
#include <avr/io.h>
#include <util/delay.h>

#define SOURCE_A_OUT_ADC ADC_MUXPOS_AIN1_gc
#define SOURCE_B_OUT_ADC ADC_MUXPOS_AIN2_gc
#define RESULT_ADC ADC_MUXPOS_AIN6_gc

inline void uartPutChar(char c){
	while (!(USART0.STATUS & USART_DREIF_bm));
	USART0.TXDATAL = c;
}
inline void uartPutProgmemStr(const char* pgstr){
	for(size_t i = 0; pgm_read_byte(&pgstr[i]) != 0; i++)
		uartPutChar(pgm_read_byte(&pgstr[i]));
}
//The fact that arabic numerals come out msb first must have been created specifically to annoy me
inline void uartPutHexByte(unsigned char val){
	for(long i = 4; i >= 0; i -= 4){
		unsigned char cursor = 0x0F << i;
		unsigned char cur = (val & cursor) >> i;
		if(cur >= 10){
			uartPutChar('A' + cur - 10);
		} else {
			uartPutChar('0' + cur);
		}
	}
}

inline void uartPutHexUInt(unsigned long val, int32_t bytes){
	unsigned char* cast = (unsigned char*)&val;
	for(int32_t i = bytes-1; i >= 0; i--)
		uartPutHexByte(cast[i]);
}

inline void uartPutHexInt(long val, int32_t bytes){
	if(val < 0){
		uartPutChar('-');
		val = -val;
	}
	uartPutHexUInt(val, bytes);
}

//Set the pinmode of TM1637_CLK and TM1637_DIO
//Output mode (1) has side effect of reducing impedance to GND and so drives the pin LOW
//Input mode (0) allows pin to be pulled HIGH by external resistors
static inline void Tm1637Set(unsigned char ClkMode, unsigned char DioMode){
	if(ClkMode)
		PORTA_DIR &= ~(1 << TM1637_CLK);
	else
		PORTA_DIR |= (1 << TM1637_CLK);
	if(DioMode)
		PORTA_DIR &= ~(1 << TM1637_DIO);
	else
		PORTA_DIR |= (1 << TM1637_DIO);
	_delay_us(TM1637_CLOCK_US);
}

//start and stop a TM1637 transaction around a block of code
#define txn(a) { \
	Tm1637Set(1, 0); \
	a \
	Tm1637Set(0,0);\
	Tm1637Set(1,0);\
	Tm1637Set(1,1);\
}

//Bang b out to the TM1637
void sendByte(unsigned char b){
	for(unsigned char i = 0; i < 8; i++) {
		Tm1637Set(0,1);
		unsigned char bit = b & 0b00000001;
		Tm1637Set(0,bit);
		Tm1637Set(1,bit);
		b >>= 1;
	}
	Tm1637Set(0,1);
	Tm1637Set(1,1);
	Tm1637Set(0,0);
}

//Assumes segs is TM1637_DIGITS bytes long
void sendSegs(const unsigned char* segs){
	txn({
		sendByte(TM1637_ADDRESS);
		for(unsigned char i = 0; i < TM1637_DIGITS; i++){
			// sendByte(segs[i]);
			sendByte(segs[pgm_read_byte(&segmentOrder[i])]);
		}
	});
}

void intToTwoSegs(int32_t i, unsigned char* segs, int32_t tenths){
	segs[1] 
		= pgm_read_byte(chars +'0' + (i%10));
	i /= 10;
	segs[0] 
		= pgm_read_byte(chars +'0' + (i%10))
		| (tenths ? pgm_read_byte(chars +'.') : 0);
}

inline void handleButtons(int32_t i, unsigned char up_mask, unsigned char down_mask, unsigned char* voltages){
	if(PORTC_IN & up_mask){
		voltages[i] = MIN(MAX_V, voltages[i]+1);
	}
	if(PORTC_IN & down_mask){
		voltages[i] = MAX(0, voltages[i]-1);
	}
}

inline unsigned short adcRawCounts(unsigned char muxpos){
	ADC0_MUXPOS = muxpos;

	ADC0_COMMAND = 0x01;

	while(ADC0_COMMAND);

	// uartPutProgmemStr(PSTR("ADC Result:")); uartPutHexUInt(ADC0_RES, 2); uartPutChar('\n');
	return MIN(ADC0_RES, 0x03FF);
}

//TODO: calibration
inline unsigned short adcTenthsVolt(unsigned short counts){
	return DIV_ROUND((counts << 5), ADC_CONVERSION_CONSTANT);
}

inline unsigned short tenthsVoltRawCount(unsigned short tenths){
	return (tenths * ADC_CONVERSION_CONSTANT) >> 5;
}

void initRegs(){
	const struct reg* r = regs;
	while(1){
		struct reg cur;
		memcpy_P(&cur, r, sizeof(struct reg));
		switch(cur.size){
			case 0:
				return;
			case 8:
				*((volatile uint8_t*)cur.target) = (uint8_t)cur.val;
				break;
			case 16:
				*((volatile uint16_t*)cur.target) = (uint16_t)cur.val;
				break;
			case 32:
				*((volatile uint32_t*)cur.target) = (uint32_t)cur.val;
				break;
		}
		r++;
	}
}

void handlePwm(unsigned char* voltage, short* pwmOutput, unsigned char adcMuxPos){
	unsigned short target = tenthsVoltRawCount(*voltage);
	unsigned short counts = adcRawCounts(adcMuxPos);
	if(counts > target && (*pwmOutput) < pwmMax){
		(*pwmOutput)++;
	} else if (counts < target && (*pwmOutput) > 0) {
		(*pwmOutput)--;
	}
}

void main(){
	//Set clock to maximum (20 MHz)
	_PROTECTED_WRITE(CLKCTRL.MCLKCTRLB, 0);

	initRegs();

	uartPutProgmemStr(PSTR("Set up regs\n"));

	int32_t sourceATargetTenths = 30;
	int32_t sourceAPwm = pwmMax;
	TCA0_SPLIT_HCMP0 = sourceAPwm >> pwmShift;
	// TCA0_SPLIT_LCMP0 = 0;
	
	
	while(1){
		int32_t sourceATargetRaw = tenthsVoltRawCount(sourceATargetTenths);
		int32_t sourceAAdc = adcRawCounts(SOURCE_A_OUT_ADC);

		int32_t error = sourceAAdc - sourceATargetRaw;
		
		// if(error > 0){
		// 	uartPutProgmemStr(PSTR("Too high\n"));
		// } else if (error < 0){
		// 	uartPutProgmemStr(PSTR("Too low\n"));
		// }

		
		// uartPutProgmemStr(PSTR("\nerror:")); uartPutHexInt(error, 4); uartPutProgmemStr(PSTR("\n"));

		sourceAPwm += error;
		// uartPutProgmemStr(PSTR("sourceAPwm:")); uartPutHexInt(sourceAPwm, 4); uartPutProgmemStr(PSTR("\n"));
		
		if(sourceAPwm < 0)
			sourceAPwm = 0;
		if(sourceAPwm > pwmMax)
			sourceAPwm = pwmMax;
		
		// uartPutProgmemStr(PSTR("sourceAPwm:")); uartPutHexInt(sourceAPwm, 4); uartPutProgmemStr(PSTR("\n"));
		TCA0_SPLIT_HCMP0 = sourceAPwm >> pwmShift;

		// _delay_ms(100);
	}

	// while(1){
	// 	uartPutProgmemStr(PSTR("Asdf\n"));
	// 	_delay_ms(25);
	// }

	// unsigned char voltages[] = { 10, 10, 10 };
	// short pwmOutputs[] = {pwmMax, pwmMax};
	// unsigned char segments[6];

	// int32_t loops = 0;

	// //Turn display on and set TM1637_BRIGHTNESS
	// Tm1637Set(1,1);
	// txn({
	// 	sendByte(TM1637_DATA);
	// });
	// txn({
	// 	sendByte( TM1637_DISPLAY				//command
	// 			| 0x08						//display is on
	// 			| (TM1637_BRIGHTNESS & 0x07)); 	//set TM1637_BRIGHTNESS
	// });

	// while(1){
	// 	// int32_t counts = adcRawCounts(SOURCE_B_OUT_ADC);
		
	// 	for(int32_t i = 0; i < 3; i++){
	// 		intToTwoSegs(voltages[i], segments + (i*2), 1);
	// 	}


	// 	if((loops++) % 300 == 0) {

	// 		handleButtons(0, PIN0_bm, PIN1_bm, voltages);
	// 		handleButtons(1, PIN2_bm, PIN3_bm, voltages);
	// 		voltages[2] = adcTenthsVolt(adcRawCounts(RESULT_ADC));
	// 		sendSegs(segments);

	// 		// uartPutProgmemStr(PSTR("Counts:")); uartPutHexUInt(counts, 4); uartPutChar('\n');
	// 		// uartPutProgmemStr(PSTR("Target:")); uartPutHexUInt(target, 4); uartPutChar('\n');
	// 		// uartPutProgmemStr(PSTR("PWM:")); uartPutHexUInt(pwmOutputs[1], 4); uartPutChar('\n');

	// 		// uartPutChar('\n');
	// 	}

	// 	handlePwm(&voltages[0], &pwmOutputs[0], SOURCE_A_OUT_ADC);
	// 	handlePwm(&voltages[1], &pwmOutputs[1], SOURCE_B_OUT_ADC);
	// 	TCA0_SPLIT_HCMP0 = pwmOutputs[0]>>pwmShift;
	// 	TCA0_SPLIT_LCMP0 = pwmOutputs[1]>>pwmShift;
		
	// 	// _delay_ms(25);
	// }
}