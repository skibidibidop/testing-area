/*
Input line max length: 20 characters
Exceeding characters will be printed on a new line
*/

#include <stdio.h>

#define COLUMN 20
#define MAXCHAR 10000

int main(void) {
	int storage[MAXCHAR];

	store_input(storage);
	fold(storage);

	return 0;
}

void store_input(si_arr[]) {
	int si_char;
	int si_i = 0;

	while ( (si_char = getchar()) != EOF ) {
		si_arr[si_i] = si_char;
		si_i++;
	}

	si_i++;
	si_arr[si_i] = '\0';

	return;
}

void fold(f_arr[]) {
	int f_limit = 0;

	for (int f_i = 0; f_arr[f_i] != '\0'; f_i++) {
		f_limit = (f_i + 1) % COLUMN;

		if ( f_limit == 0 && !isblank(f_arr[f_i]) ) {
			printf("-\n");
		}
		else if ( f_limit == 0 && isblank(f_arr[f_i]) ) {
			printf("\n");
		}

		printf("%c", f_arr[f_i]);
	}
}
