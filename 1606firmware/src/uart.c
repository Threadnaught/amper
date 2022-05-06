#include "updown.h"

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

inline void uartPutHexInt(unsigned long val, int bytes){
	unsigned char* cast = (unsigned char*)&val;
	for(int i = bytes-1; i >= 0; i--)
		uartPutHexByte(cast[i]);
}