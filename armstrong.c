#include <stdio.h>
#include <stdlib.h>

int testaarmstrong (int);

int main (int argc, char *argv[]) {
  int n;
  printf("Entre um numero: ");
  scanf("%d", &n);
  if (testaarmstrong(n)) {
    puts("Eh Armstrong");
  }
  else
    puts("Nao eh armstrong");
  
  puts("foo");
  return 0;

}
