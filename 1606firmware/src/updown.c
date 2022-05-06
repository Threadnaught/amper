#include "updown.h"
#include "regs.h"

void initRegs(){
	_PROTECTED_WRITE(CLKCTRL.MCLKCTRLB, 0);
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

volatile int vector_count = 0;
volatile int voltage_target = 15;
volatile short railAState = pwmMax;

ISR(TCA0_HUNF_vect){
	if(vector_count++ < (1<<4)){
		TCA0_SPLIT_INTFLAGS = TCA_SPLIT_HUNF_bm;
		return;
	}
	vector_count = 0;

	// short targetCounts = tenthsVoltRawCount(voltage_target);
	// short currentCounts = adcRawCounts(SOURCE_A_OUT_ADC);
	// short error = targetCounts - currentCounts;
	// error >>= 4;
	// pwmValueA -= error;
	// if(pwmValueA < 0) pwmValueA = 0;
	// if(pwmValueA > pwmMax) pwmValueA = pwmMax;
	// TCA0_SPLIT_HCMP0 = pwmValueA>>pwmShift;

	handleRail(voltage_target, &railAState, SOURCE_A_OUT_ADC, &TCA0_SPLIT_HCMP0);
	

	TCA0_SPLIT_INTFLAGS = TCA_SPLIT_HUNF_bm;
}

void main(){
	initRegs();
	initTm1637();
	sei();

	// uartPutProgmemStr(PSTR("pwm value (post clamp):")); uartPutHexInt(pwmValueA,2); uartPutChar('\n');

	uartPutProgmemStr(PSTR("started\n"));

	unsigned char segs[] = {0x00,0x00,0x00,0x00,0x00,0x00};
	while(1){
		ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
			intToTwoSegs(adcTenthsVolt(adcRawCounts(SOURCE_A_OUT_ADC)), segs, 1);
			uartPutProgmemStr(PSTR("pwm value:")); uartPutHexInt(railAState,2); uartPutChar('\n');
		}
		sendSegsTm1637(segs);
		_delay_ms(1);
	}
}