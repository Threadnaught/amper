#ifndef __AVR_ATmega328P__
  #define __AVR_ATmega328P__
#endif

#define F_CPU 20000000UL
#include <inttypes.h>
#include <avr/io.h>
#include <util/delay.h>

#define LED_DATA	0x40
#define LED_ADDRESS	0xC0
#define LED_DISPLAY	0x80
#define DATA_CLOCK_US 100

//0x00 - 0x0f
#define BRIGHTNESS 0x00
// #define BRIGHTNESS 0x0f

#define CLK PD4
#define DIO PD5

#define DIGITS 6

//Set the pinmode of CLK and DIO
//Output mode (1) has side effect of setting impeadance to GND and so able to drive pin LOW
//Input mode (0) allows pin to be pulled up by external resistors
inline void SetClkDioMode(unsigned char ClkMode, unsigned char DioMode){
	if(ClkMode)
		DDRD &= ~(1 << CLK);
	else
		DDRD |=	(1 << CLK);
	if(DioMode)
		DDRD &= ~(1 << DIO);
	else
		DDRD |=	(1 << DIO);
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

//Bang the bits to the TM1637
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

//Assumes segs is 6 bytes long
void sendSegs(const unsigned char* segs){
	txn({
		sendByte(LED_ADDRESS);
		for(unsigned char i = 0; i < DIGITS; i++){
			sendByte(segs[(DIGITS-1) - i]);
		}
	});
}

unsigned char segments[] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05 };
void main(){
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
		for(int i = 0; i < 6; i++) segments[i]++;
		// All segments on
		sendSegs(segments);
	}
}