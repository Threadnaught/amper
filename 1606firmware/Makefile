default: bin/updown.hex 

bin/%.hex: %.c constants.h chars.h
	avr-gcc -mmcu=attiny1606 -o bin/$<.bin $< -O3
	 
	avr-objcopy -j .text -j .data -O ihex bin/$<.bin $@
	avrdude -c jtag2updi -p t1606 -P /dev/ttyUSB0 -U flash:w:$@:i