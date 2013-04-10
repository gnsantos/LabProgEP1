/*
Vinicius Vendramini - NUSP: 7991103
Gervasio Santos - NUSP: 7990996
EP1 de LabProg - primeiro semestre de 2013
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define STRING_MAX 80


int ehArmstrong(char *arqentrada, char* arqsaida){
  FILE* entrada, *saida;
  int cont = 0;
  int digitos;
  int i, sum = 0, aux, n;
  
  entrada = fopen(arqentrada, "r");
  saida = fopen(arqsaida, "w");
  
  while( fscanf(entrada, "%d", &n) != EOF  ){
    aux = n;
    digitos = (int)log10(n) +1;
    sum = 0;
    for( i = 0; i < digitos; i++){
      sum += pow(n%10, digitos);
      n /= 10;
    }
    if( sum == aux){
      cont++;
      fprintf(saida, "%d ");
    }
  }
 
  return cont;
}

int main(int argc, char* argv[]){
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

	  soma = ehArmstrong(nomeArquivoEntrada, nomeArquivoSaida);

	  fim = clock(); /* marca horario de fim da execucao */
	  tempo_execucao = (double)(fim - inicio) / CLOCKS_PER_SEC;
	  printf("A execucao da funcao levou %f segundos \n", tempo_execucao);
	}
	
	else if(argc == 3){
	  inicio = clock(); /* marca o horario de inicio da execucao */

	  soma = ehArmstrong(argv[1], argv[2]);

	  fim = clock(); /* marca horario de fim da execucao */
	  tempo_execucao = (double)(fim - inicio) / CLOCKS_PER_SEC;
	  printf("A execucao da funcao levou %f segundos \n", tempo_execucao);
	}

	printf("%d numero(s) de Armstrong encontrado(s).\n", soma);
	return 0;
  
}
