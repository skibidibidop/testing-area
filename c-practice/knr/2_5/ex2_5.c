// If a character from string2 matches a character from string1 for
// 	the first time, return the location of the element from
// 	string1
// Return -1 if no matches

#include <stdio.h>

#define MAXCHAR 1000

void store_input(char si_arr[]);

int main(void) {
	char string1[MAXCHAR];
	char string2[MAXCHAR];
	int string3[MAXCHAR];

	printf("***MATCH LOCATOR***\n");
	printf("Input reference: ");
	store_input(string2);
	printf("Input string for processing: ");
	store_input(string2);

	return 0;
}

// Store input in array
void store_input(char si_arr[]) {
	char si_char;
	int si_i = 0;

	while ( (si_char = getchar()) != '\n' ) {
		si_arr[si_i] = si_char;
		si_i++;
	}

	si_arr[si_i] = '\0';

	return;
}
