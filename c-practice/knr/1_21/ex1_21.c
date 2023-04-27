/*
Put string input in array
Replace strings of blanks w/ min. no. of \t & - to achieve
	the same spacing. Use the same TABSTOP (8) in 1-20
*/

#include <stdio.h>

#define MAXCHAR 10000
#define TABSTOP 8

void store_input(int s_arr[]);
void print_nonspace(int p_arr[]);
void entab(int e_tabstop, int e_spaces, int e_trailing);

int main(void) {
	int arr[MAXCHAR];

	printf("Provide input. Ctrl + d to end.\n");
	printf("Input: \n");

	store_input(arr);
	print_nonspace(arr); // this calls entab()

	return 0;
}

// Store input in array, terminate with '\0'
void store_input(int s_arr[]) {
	int character;
	int s_i = 0;

	for ( ; (character = getchar()) != EOF; s_i++) {
		s_arr[s_i] = character;
	}
	
	s_i++;
	s_arr[s_i] = '\0';

	return;
}

// Count no. of space and non-space characters
// Print non-space characters
// Call entab() to print spaces and tabs
void print_nonspace(int p_arr[]) {
	int p_nonspace = 0;
	int p_spaces = 0;
	int p_tabstop = 0;
	int p_trailing = 0;

	for (int p_i = 0; p_arr[p_i] != '\0'; p_i++) {
		if (p_arr[p_i] != ' ') {
			printf("%c", p_arr[p_i]);
			p_nonspace++;
		}

		if (p_arr[p_i] == ' ' && p_arr[p_i + 1] == ' ') {
			p_spaces++;
		}

		if (p_arr[p_i] == ' ' && p_arr[p_i + 1] != ' ') {
			p_spaces++;
			p_tabstop = TABSTOP - (p_nonspace % TABSTOP);
			p_spaces -= p_tabstop;
			p_trailing = p_spaces % TABSTOP;

			entab(p_tabstop, p_spaces, p_trailing);
			p_spaces = 0;
			p_nonspace = 0;
		}
	}

	return;
}

void entab(int e_tabstop, int e_spaces, int e_trailing) {
	int e_tabs = 0;

	if (e_tabstop == TABSTOP) {
		printf("\\t");
	}
	else {
		for (int e_i = 0; e_i < e_tabstop; e_i++) {
			printf("-");
		}
	}

	if (e_spaces >= 0) {
		e_tabs = e_spaces / TABSTOP;
	}

	for (int e_j = 0; e_j < e_tabs; e_j++) {
		printf("\\t");
	}

	if (e_spaces > 0) {
		printf("\\t");
	}

	return;
}
