default: bin/TM1637-new.hex

bin/%.hex: %.c *.h
	avr-gcc -mmcu=atmega328p -o bin/$<.bin $< -O3
	avr-objcopy -j .text -j .data -O ihex bin/$<.bin $@
	avrdude -p atmega328p -c usbasp -U flash:w:$@:i -F -P usb