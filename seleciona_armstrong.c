/*
Vinicius Vendramini - NUSP: 7991103
Gervasio Santos - NUSP: 7990996
EP1 de LabProg - primeiro semestre de 2013
*/


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define STRING_MAX 80

int seleciona_armstrongs(char* entrada, char* saida);

int main (int argc, char *argv[]) {
	int soma;
	char nomeArquivoEntrada[STRING_MAX], nomeArquivoSaida[STRING_MAX];
	clock_t inicio, fim;
	double tempo_execucao;
	
	if(argc != 3){
	  printf("Entre o nome do arquivo de entrada: ");
	  scanf("%s", nomeArquivoEntrada);
	
	  printf("Entre o nome do aruivo de saida: ");	
	  scanf("%s", nomeArquivoSaida);

	  inicio = clock(); /* marca o horario de inicio da execucao */

	  soma = seleciona_armstrongs(nomeArquivoEntrada, nomeArquivoSaida);

	  fim = clock(); /* marca horario de fim da execucao */
	  tempo_execucao = (double)(fim - inicio) / CLOCKS_PER_SEC;
	  printf("A execucao da funcao levou %f segundos \n", tempo_execucao);
	}
	
	else if(argc == 3){
	  inicio = clock(); /* marca o horario de inicio da execucao */

	  soma = seleciona_armstrongs(argv[1], argv[2]);

	  fim = clock(); /* marca horario de fim da execucao */
	  tempo_execucao = (double)(fim - inicio) / CLOCKS_PER_SEC;
	  printf("A execucao da funcao levou %f segundos \n", tempo_execucao);
	}

	printf("%d numero(s) de Armstrong encontrado(s).\n", soma);
	return 0;
}
