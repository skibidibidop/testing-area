/* Remove all comments from a C program */

#include <stdio.h>

#define MAXCHAR 10000

int main(void) {
	int storage[MAXCHAR];

	printf("***Comment Scrubber***\n");
	printf("Input C program. Ctrl + d to end input.\n");
	printf("Input:\n");

	store_input(storage);
	remove_comments(storage);

	return;
}

void store_input(si_arr[]) {
	int si_char;
	int si_i = 0;

	while ( ( si_char = getchar() ) != EOF ) {
		si_arr[si_i] = si_char;
		si_i++;
	}

	si_i++;
	si_arr[si_i] = '\0';

	return;
}

void remove_comments(rc_arr[]) {
	
}
