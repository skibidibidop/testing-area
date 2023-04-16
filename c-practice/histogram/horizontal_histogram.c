// Horizontal bar histogram of length of words in input
// Use arrays
// Use these as input:
// a ab ab abc abc abc abcd abcd abcde
// 	length(freq): 1(1) 2(2) 3(3) 4(2) 5(1)
// asd jkli qwerty zidmm jein neuy lkjf a n der jl ku la
// 	1(2) 2(3) 3(2) 4(3) 6(1) 5(1)

#include <stdio.h>
#include <ctype.h>

int main(void) {
	int character;
	int length = 0;
	int frequency[10];

	for (int i = 0; i < 10; i++) {
		frequency[i] = 0;
	}

	printf("Input words that are less than 11 characters: ");

	while ( (character = getchar()) != EOF ) {
		if ( isalnum(character) ) {
			length++;
		}
		else {
			frequency[length - 1]++;
			length = 0;
		}
	}

	printf("Word length      Frequency\n\n");

	for (int j = 0; j < 10; j++) {
		printf("%i", j + 1);
		printf("\t\t ");

		for (int k = 0; k < frequency[j]; k++) {
			printf("|");
		}

		printf("\n");
	}

	return 0;
}
