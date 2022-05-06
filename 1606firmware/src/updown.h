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


#define BAUDRATE 115200
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


#define SOURCE_A_OUT_ADC ADC_MUXPOS_AIN1_gc
#define SOURCE_B_OUT_ADC ADC_MUXPOS_AIN2_gc
#define RESULT_ADC ADC_MUXPOS_AIN6_gc

// where max voltage is in tenths:
// (2 multiplier comes from the fact its behind a 1:1 voltage divide)
// 2 * measured value / (max value / max voltage)
// = 2 * (measured value << 5) / ((max value <<	5) / max voltage)
// = 2 * (measured value << 5) / ((0x3FF << 5) / 43)
// ~= 2 * (measured value << 5) / 0x02F9
// ~= (measured value << 6) / 0x02F9
#define ADC_CONVERSION_CONSTANT 0x02F9

#define DEBOUNCE_CYCLES 75

#define MAX_V 43
#define MIN_V 0
#define pwmShift 6
#define pwmMax 127 << pwmShift

//util funcs:
#define MAX(a,b) (a>b)?a:b
#define MIN(a,b) (a<b)?a:b
#define DIV_ROUND(a,b) (a + (b/2))/b

void initTm1637();
void sendSegsTm1637(const unsigned char* segs);
void intToTwoSegs(int i, unsigned char* segs, int tenths);

unsigned short adcRawCounts(unsigned char muxpos);
unsigned short adcTenthsVolt(unsigned short counts);
unsigned short tenthsVoltRawCount(unsigned short tenths);
void handleRail(unsigned char targetVoltage, volatile short* state, unsigned char adcMuxPos, volatile unsigned char* pwmRegister);


void uartPutChar(char c);
void uartPutProgmemStr(const char* pgstr);
void uartPutHexByte(unsigned char val);
void uartPutHexInt(unsigned long val, int bytes);

#endif