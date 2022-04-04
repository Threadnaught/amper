#ifndef __AVR_ATtiny1606__
#define __AVR_ATtiny1606__
#endif

#include <avr/pgmspace.h>
#include <avr/io.h>
#include <inttypes.h>

struct reg{
	volatile void* target;
	uint8_t size;
	uint32_t val;
};

#define F_CPU 20000000UL

#define BAUDRATE 9600
#define BAUD_REG (uint16_t)((float)(F_CPU * 64 / (16 *(float)BAUDRATE)) + 0.5)

//TM1637:
#define TM1637_DATA	0x40
#define TM1637_ADDRESS	0xC0
#define TM1637_DISPLAY	0x80
#define TM1637_CLOCK_US 1 //10 is a safe value
#define TM1637_BRIGHTNESS 0x00 //0x00 - 0x0f
#define TM1637_CLK PIN4
#define TM1637_DIO PIN5
#define TM1637_DIGITS 6

const unsigned char segmentOrder[6] PROGMEM = {2,3,5,4,1,0};

// where max voltage is in tenths:
// measured value / (max value / max voltage)
// = (measured value << 5) / ((max value <<	5) / max voltage)
// = (measured value << 5) / ((0x3FF << 5) / 43)
// ~= (measured value << 5) / 0x02F9
#define ADC_CONVERSION_CONSTANT 0x02F9

#define MAX_V 43
#define MIN_V 0
#define pwmShift 10
#define pwmMax ((int32_t)127) <<pwmShift

//util funcs:
#define MAX(a,b) (a>b)?a:b
#define MIN(a,b) (a<b)?a:b
#define DIV_ROUND(a,b) (a + (b/2))/b

const struct reg regs[] PROGMEM = {
	//setup pin directions;
	{&PORTA_DIR, 8, PIN3_bm},
	{&PORTB_DIR, 8, PIN0_bm | PIN2_bm},
	{&PORTC_DIR, 8, 0x00},
	//UART setup:
	{&USART0_BAUD, 16, BAUD_REG},
	{&USART0_CTRLC, 8, USART_CHSIZE0_bm | USART_CHSIZE1_bm},
	{&USART0_CTRLB, 8, USART_TXEN_bm},//enable always last
	//ADC setup:
	{&VREF_CTRLA, 8, VREF_ADC0REFSEL_4V34_gc},
	{&ADC0_CTRLB, 8, 0x00},
	{&ADC0_CTRLC, 8, ADC_PRESC0_bm | ADC_PRESC1_bm | ADC_PRESC2_bm},
	{&ADC0_CTRLD, 8, 0x00},
	{&ADC0_CTRLE, 8, 0x00},
	{&ADC0_CALIB, 8, ADC_DUTYCYC_bm},
	{&ADC0_CTRLA, 8, ADC_ENABLE_bm},//enable always last
	//PWM setup:
	{&TCA0_SINGLE_CTRLD, 8, TCA_SINGLE_SPLITM_bm},
	{&TCA0_SPLIT_LPER, 8, 127},
	{&TCA0_SPLIT_HPER, 8, 127},
	{&TCA0_SPLIT_LCMP0, 8, 127},
	{&TCA0_SPLIT_HCMP0, 8, 127},
	{&TCA0_SPLIT_CTRLB, 8, TCA_SPLIT_HCMP0EN_bm | TCA_SPLIT_LCMP0EN_bm},
	{&TCA0_SPLIT_CTRLA, 8, TCA_SPLIT_ENABLE_bm},//enable always last
	//Terminate:
	{0x00, 0, 0x00},
};