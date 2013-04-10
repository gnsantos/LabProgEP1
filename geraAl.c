
#include <stdio.h>
#include <stdlib.h>
#include <math.h> 

int main(int argc, char* argv[]){
	FILE *saida;
	int i = 0;
	
	char modo = argv[1][0];
	char* name = argv[2];
	int n = atoi(argv[3]);
	int s = atoi(argv[4]);
	
	if (modo == 's') {
	  saida = fopen(name, "w");
	  for (i = 0; i<n; i++) {
	    fprintf(saida,"%d ", i);
	  }
	}
	else {
	  srand(s);
	  saida = fopen(name, "w");
	  for(i = 0; i < n; i++){
	    int random = rand();
	    fprintf(saida, "%d ", random);
	  }
	}
	fclose(saida);
	return 0;
}

