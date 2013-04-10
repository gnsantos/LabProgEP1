#include <stdio.h>
#include <stdlib.h>

#define STRING_MAX 80

int seleciona_armstrong(char* entrada, char* saida);

int main (int argc, char *argv[]) {
	int soma;
	char nomeArquivoEntrada[STRING_MAX], nomeArquivoSaida[STRING_MAX];

	printf("Entre o nome do arquivo de entrada: ");
	scanf("%s", nomeArquivoEntrada);
	
	printf("Entre o nome do aruivo de saida: ");	
	scanf("%s", nomeArquivoSaida);

	soma = seleciona_armstrong(nomeArquivoEntrada, nomeArquivoSaida);
	printf("%d numero(s) de Armstrong encontrado(s).\n", soma);
	return 0;
}
