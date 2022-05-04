#include "updown.h"

struct reg{
	volatile void* target;
	uint8_t size;
	uint32_t val;
};

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
	{&TCA0_SPLIT_INTCTRL, 8, TCA_SPLIT_HUNF_bm},
	{&TCA0_SPLIT_CTRLA, 8, TCA_SPLIT_ENABLE_bm},//enable always last
	//Terminate:
	{0x00, 0, 0x00},
};