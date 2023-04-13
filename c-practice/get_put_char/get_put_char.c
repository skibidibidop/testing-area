#include <stdio.h>

int main(void){
	printf("Give a SINGLE character and I'll echo it back.\n");
	int input = getchar();
	putchar(input);
	printf("\n");

	return 0;
}
