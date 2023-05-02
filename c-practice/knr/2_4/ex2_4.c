// Take string1 and string2
// Delete any character in string1 that matches a character
// 	in string2

#include <stdio.h>
#include <stdbool.h>

#define MAXCHAR 1000

void store_input(char s_arr[]);
void squeeze(char sq_arr1[], char sq_arr2[]);

int main(void) {
	char string1[MAXCHAR];
	char string2[MAXCHAR];

	printf("***MATCH DELETER***\n");

	printf("Input reference: ");
	store_input(string2);
	printf("Input string to be modified: ");
	store_input(string1);

	squeeze(string1, string2);
	printf("Matches removed. New string:\n %s\n", string1);

	return 0;
}

void store_input(char s_arr[]) {
	char s_character;
	int s_i = 0;

	while ( (s_character = getchar()) != '\n') {
		s_arr[s_i] = s_character;
		s_i++;
	}

	s_arr[s_i] = '\0';

	return;
}

void squeeze(char sq_arr1[], char sq_arr2[]) {
	int sq_i;
	int sq_j;
	int sq_k = 0;
	bool sq_match;

	for (sq_i = 0; sq_arr1[sq_i] != '\0'; sq_i++) {
		sq_match = false;

		for (sq_j = 0; sq_arr2[sq_j] != '\0'; sq_j++) {
			if (sq_arr1[sq_i] == sq_arr2[sq_j]) {
				sq_match = true;
				break;
			}
		}

		if (!sq_match) {
			sq_arr1[sq_k] = sq_arr1[sq_i];
			sq_k++;
		}
	}

	sq_arr1[sq_k] = '\0';

	return;
}
