prog: testaarmstrong.o armstrong.c
	gcc -g -o prog armstrong.c testaarmstrong.o

testaarmstrong.o: testaarmstrong.s
	as --32 -o testaarmstrong.o testaarmstrong.s