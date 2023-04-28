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
}

void store_input(si_arr[]) {
	int si_char;
	int si_i = 0;

	while ( (si_char = getchar()) != EOF ) {
		si_arr[si_i] = si_char;
		si_i++;
	}

	return;
}
