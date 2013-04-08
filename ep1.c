#include <stdio.h>
#include <stdlib.h>
#include <math.h>

FILE* randomNumberList(int seed, int n, char name[]){
  unsigned int random;
  int i;
  FILE *saida;
  srand(seed);
  saida = fopen(name, "w");
  for(i = 0; i < n; i++){
    random = (unsigned int) rand();
    fprintf(saida, "%d ", random);
  }
  return saida;
}

int ehArmstrong(unsigned int n){
  int digitos = (int) log10(n) + 1;
  int i, sum = 0, aux = n;
  for( i = 0; i < digitos; i++){
    sum += pow(n%10, digitos);
    n /= 10;
  }
  if( sum == aux) return 1;
  return 0;
}

int main(int argc, char* argv[]){
  unsigned int num;
  int cont = 0;
  FILE *entrada, *saida;

  entrada = randomNumberList(10, 100000000, argv[1]);
  saida = fopen(argv[2], "w");
  while( fscanf(entrada, "%d", &num) != EOF ){
    if(ehArmstrong(num)){
      cont++;
      fprintf(saida, "%d\n", num);
    }
  }
  printf("Ha %d numeros de Armstrong no arquivo de entrada\n", cont);
  fclose(entrada); fclose(saida);
  return 0;
}
