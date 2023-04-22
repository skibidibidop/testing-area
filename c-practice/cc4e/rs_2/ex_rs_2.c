#include <stdio.h>

int main(void) {
	int usf = 0;
  
  	printf("Enter US Floor\n");
  	scanf("%i", &usf);
  	printf("EU Floor %i\n", usf - 1);
  
  	return 0;
}