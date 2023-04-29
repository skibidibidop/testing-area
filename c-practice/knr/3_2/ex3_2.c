/*
Store input in array0.
Convert escape sequences to their visible representations.
Store in array1, and then print. Newline character will be
printed as \n, etc.
Convert escape sequences in array1 back to how they are
supposed to be displayed. Store in array2, then print.
*/

#include <stdio.h>

#define MAXCHAR 10000

int main(void) {
	int storage[MAXCHAR];

	store_input(storage);

	return 0;
}

void store_input(int s_arr[]) {
	int s_char;
	int s_i = 0;

	while ( (s_char = getchar()) != EOF) {
		s_arr[s_i] = s_char;
		s_i++;
	}

	s_arr[s_i + 1] = '\0';

	return;
}

