AC_JAR ?= lib/AppleCommander/AppleCommander-1.3.5.13-ac.jar

.PHONY:
all:
	ca65 ../src/tapeout.asm --listing tapeout.lst
	ld65 ../src/tapeout.o -o tapeout.bin -C area_300.cfg
	ca65 ../src/bitbangr.asm --listing bitbangr.lst
	ld65 ../src/bitbangr.o -o bitbangr.bin -C area_300.cfg

	@cp tlcBase.dsk tlc.dsk
	cat bitbangr.bin | java -jar ${AC_JAR} -p tlc.dsk BITB BIN 0x0300

.PHONY:
clean:
	-rm ../src/*.o
	-rm *.lst
	-rm bitbangr.bin
	-rm tapeout.bin
