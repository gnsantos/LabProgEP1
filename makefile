sel: seleciona_armstrong.o testaarmstrong.o seleciona_armstrong.c
	gcc -g -o prog seleciona_armstrong.c seleciona_armstrong.o testaarmstrong.o

seleciona_armstrong.o: seleciona_armstrong.asm
	nasm -f elf32 -o seleciona_armstrong.o seleciona_armstrong.asm

testaarmstrong.o: testaarmstrong.s
	as --32 -o testaarmstrong.o testaarmstrong.s

clean:
	rm -f *.o