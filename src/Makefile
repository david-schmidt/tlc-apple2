.PHONY:
all:
	ca65 tapeout.asm --listing tapeout.lst
	ld65 tapeout.o -o tapeout.bin -C tapeout.cfg
