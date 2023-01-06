all : helloworld oddnums putsasm oddnums_c printnum

helloworld : helloworld.s
	cc helloworld.s -o helloworld.bin -nostdlib -g

oddnums : oddnums.s
	cc oddnums.s -o oddnums.bin -nostdlib -g

putsasm : putsasm.s
	cc putsasm.s -o putsasm.bin -g

oddnums_c : oddnums.c
	cc oddnums.c -o oddnums_c.bin -g

printnum : printnum.s
	cc printnum.s -o printnum.bin -g -nostdlib

clean :
	rm *.bin *.o
