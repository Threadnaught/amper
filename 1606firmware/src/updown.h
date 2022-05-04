#ifndef updown_h
#define updown_h


#ifndef __AVR_ATtiny1606__
#define __AVR_ATtiny1606__
#endif

#define F_CPU 20000000UL

#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h> 
#include <util/delay.h>
#include <util/atomic.h>
#include <avr/pgmspace.h>


#define BAUDRATE 9600
#define BAUD_REG (uint16_t)((float)(F_CPU * 64 / (16 *(float)BAUDRATE)) + 0.5)

//TM1637:
#define TM1637_DATA	0x40
#define TM1637_ADDRESS	0xC0
#define TM1637_DISPLAY	0x80
#define TM1637_CLOCK_US 10 //100 is a safe value
#define TM1637_BRIGHTNESS 0x00 //0x00 - 0x0f
#define TM1637_CLK PIN4
#define TM1637_DIO PIN5
#define TM1637_DIGITS 6

// where max voltage is in tenths:
// measured value / (max value / max voltage)
// = (measured value << 5) / ((max value <<	5) / max voltage)
// = (measured value << 5) / ((0x3FF << 5) / 43)
// ~= (measured value << 5) / 0x02F9
#define ADC_CONVERSION_CONSTANT 0x02F9

#define DEBOUNCE_CYCLES 75

#define MAX_V 43
#define MIN_V 0
#define pwmShift 5
#define pwmMax 127 << pwmShift

//util funcs:
#define MAX(a,b) (a>b)?a:b
#define MIN(a,b) (a<b)?a:b
#define DIV_ROUND(a,b) (a + (b/2))/b

void initTm1637();
void sendSegsTm1637(const unsigned char* segs);
void intToTwoSegs(int i, unsigned char* segs, int tenths);

#endif