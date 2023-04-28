/* Remove all comments from a C program */

#include <stdio.h>
#include <stdbool.h>

#define MAXCHAR 10000

void remove_comments(int r_arr[]);
void store_input(int s_arr[]);

int main(void) {
	int storage[MAXCHAR];

	printf("***Comment Scrubber***\n");
	printf("Input C program. Ctrl + d to end input.\n");
	printf("Input:\n");

	store_input(storage);
	remove_comments(storage);

	return 0;
}

void store_input(int s_arr[]) {
	int s_char;
	int s_i = 0;

	while ( ( s_char = getchar() ) != EOF ) {
		s_arr[s_i] = s_char;
		s_i++;
	}

	s_i++;
	s_arr[s_i] = '\0';

	return;
}

void remove_comments(int r_arr[]) {
	bool r_printflag = true;

	for (int r_i = 0; r_arr[r_i] != '\0'; r_i++) {
		if (r_arr[r_i] == '/' && r_arr[r_i + 1] == '*') {
			r_printflag = false;
		}
		else if (r_arr[r_i] == '*' && r_arr[r_i + 1] == '/') {
			r_printflag = true;
			r_i++;
		}

		if (r_printflag = true) {
			printf("%c", r_arr[r_i]);
		}
	}

	return;
}
