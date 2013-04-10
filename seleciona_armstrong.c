#include <stdio.h>
#include <stdlib.h>


int seleciona_armstrong();

int main (int argc, char *argv[]) {
	int soma;
	soma = seleciona_armstrong();
	printf("A soma dos numeros no arquivo de entrada eh: %d.\n", soma);
	return 0;
}
