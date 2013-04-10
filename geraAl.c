
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

int main(int argc, char* argv[]){
	FILE *saida;
	int i = 0;
	
	char* name = argv[1];
	int n = atoi(argv[2]);
	int s = atoi(argv[3]);
	
	srand(s);
  	saida = fopen(name, "w");
  	for(i = 0; i < n; i++){
  		int random = rand();
  		fprintf(saida, "%d ", random);
 	 }

	fclose(saida);
	return 0;
}

