/*
Put string input in array
Replace strings of blanks w/ min. no. of \t & - to achieve
	the same spacing. Use the same TABSTOP (8) in 1-20
If no. of consecutive spaces >= TABSTOP
	no. of \\t to print = TABSTOP / 8
		The printed \t is a representation of an
		actual tab which is 8 characters wide
	no. of - to print  = TABSTOP % 8
*/

#include <stdio.h>

#define MAXCHAR 10000
#define TABSTOP 8

void store_input(int s_arr[]);

int main(void) {
	int arr[MAXCHAR];

	printf("Provide input. Ctrl + d to end.\n");
	printf("Input: \n");

	store_input(arr);

	return 0;
}

void store_input(int s_arr[]) {
	int character;

	for (int s_i = 0; (character = getchar()) != EOF; s_i++) {
		s_arr[s_i] = character;
	}

	return;
}
