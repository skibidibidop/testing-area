// Check how prefixes affect format specifiers

#include <stdio.h>

int main(void){
	int integer = 100;
	char character = 'b';
	float pointed = 50.534;
	
	printf("%10i\n", integer);
	printf("%5c\n", character);
	printf("%20f\n", pointed);
	printf("%20.2f\n", pointed);

	return 0;
}
