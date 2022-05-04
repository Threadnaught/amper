bin/updown.hex: src/*.c src/*.h
	avr-gcc -mmcu=attiny1606 -o bin/updown.bin src/*.c -O3
	 
	avr-objcopy -j .text -j .data -O ihex bin/updown.bin bin/updown.hex
	avrdude -c jtag2updi -p t1606 -P /dev/ttyUSB0 -U flash:w:bin/updown.hex:i