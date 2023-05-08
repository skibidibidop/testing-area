/*
 * Author: Mark Beltran
 * Date: May 8, 2023
 *
 * Test input from .txt file
*/

#include <stdio.h>

int main(void) {
	char input;

	while ( (input = getchar()) != EOF ) {
		printf("%c", input);
	}

	printf("\n");

	return 0;
}
