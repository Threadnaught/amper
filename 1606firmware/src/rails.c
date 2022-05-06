#include "updown.h"

inline unsigned short adcRawCounts(unsigned char muxpos){
	ADC0_MUXPOS = muxpos;

	ADC0_COMMAND = 0x01;

	while(ADC0_COMMAND);

	// uartPutProgmemStr(PSTR("ADC Result:")); uartPutHexInt(ADC0_RES, 2); uartPutChar('\n');
	return MIN(ADC0_RES, 0x03FF);
}

//TODO: calibration
inline unsigned short adcTenthsVolt(unsigned short counts){
	return DIV_ROUND((counts << 6), ADC_CONVERSION_CONSTANT);
}

inline unsigned short tenthsVoltRawCount(unsigned short tenths){
	return (tenths * ADC_CONVERSION_CONSTANT) >> 6;
}

// void handleRail(unsigned char targetVoltage, volatile short* pwmOutput, unsigned char adcMuxPos, volatile unsigned char* target_register){
// 	unsigned short target = tenthsVoltRawCount(targetVoltage);
// 	unsigned short counts = adcRawCounts(adcMuxPos);
// 	if(counts > target && (*pwmOutput) < pwmMax){
// 		(*pwmOutput)++;
// 	} else if (counts < target && (*pwmOutput) > 0) {
// 		(*pwmOutput)--;
// 	}
// }

void handleRail(unsigned char targetVoltage, volatile short* state, unsigned char adcMuxPos, volatile unsigned char* pwmRegister){
	short targetCounts = tenthsVoltRawCount(targetVoltage);
	short currentCounts = adcRawCounts(SOURCE_A_OUT_ADC);
	short error = targetCounts - currentCounts;
	error >>= 4;
	(*state) -= error;
	if((*state) < 0) (*state) = 0;
	if((*state) > pwmMax) (*state) = pwmMax;
	(*pwmRegister) = (*state)>>pwmShift;
}