#include "updown.h"
#include "regs.h"

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

volatile int pwmval = 64;
volatile int vector_count = 0;

ISR(TCA0_HUNF_vect){
	if(vector_count++ < (1<<11)){
		TCA0_SPLIT_INTFLAGS = TCA_SPLIT_HUNF_bm;
		return;
	}
	vector_count = 0;
	pwmval = (pwmval+1)%100;
	TCA0_SPLIT_INTFLAGS = TCA_SPLIT_HUNF_bm;
}

void main(){
	_PROTECTED_WRITE(CLKCTRL.MCLKCTRLB, 0);
	initRegs();
	initTm1637();

	sei();

	unsigned char segs[] = {0x00,0x00,0x00,0x00,0x00,0x00};
	while(1){
		ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
			intToTwoSegs(pwmval, segs, 0);
			sendSegsTm1637(segs);
		}
		_delay_ms(1);
	}
}