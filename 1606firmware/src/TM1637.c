#include "updown.h"
#include "chars.h"

const unsigned char segmentOrder[6] PROGMEM = {2,3,5,4,1,0};

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
void sendSegsTm1637(const unsigned char* segs){
	txn({
		sendByte(TM1637_ADDRESS);
		for(unsigned char i = 0; i < TM1637_DIGITS; i++){
			// sendByte(segs[i]);
			sendByte(segs[pgm_read_byte(&segmentOrder[i])]);
		}
	});
}

void initTm1637(){
	Tm1637Set(1,1);
	txn({
		sendByte(TM1637_DATA);
	});
	txn({
		sendByte( TM1637_DISPLAY				//command
				| 0x08						//display is on
				| (TM1637_BRIGHTNESS & 0x07)); 	//set TM1637_BRIGHTNESS
	});

	unsigned char segs[] = {0x00,0x00,0x00,0x00,0x00,0x00};
	sendSegsTm1637(segs);
}

void intToTwoSegs(int i, unsigned char* segs, int tenths){
	segs[1] 
		= pgm_read_byte(chars +'0' + (i%10));
	i /= 10;
	segs[0] 
		= pgm_read_byte(chars +'0' + (i%10))
		| (tenths ? pgm_read_byte(chars +'.') : 0);
}