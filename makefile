sel: seleciona_armstrong.o testaarmstrong.o seleciona_armstrong.c
	gcc -m32 -g -o sel seleciona_armstrong.c testaarmstrong.o seleciona_armstrong.o

testaarmstrong.o: testaarmstrong.s
	as --32 -o testaarmstrong.o testaarmstrong.s

seleciona_armstrong.o: seleciona_armstrong.asm
	nasm -f elf32 -o seleciona_armstrong.o seleciona_armstrong.asm

clean:
	rm -f *.o
