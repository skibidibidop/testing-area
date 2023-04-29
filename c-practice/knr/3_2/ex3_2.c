/*
Store input in array0.
Convert '\n' & '\t' to their visible representations.
Store in array1, and then print. Newline character will be
printed as \n, etc.
Convert consecutive '\', 'n' & '\', 't' in array1 back to
how they are supposed to be displayed. Store in array2,
then print.
*/

#include <stdio.h>

#define MAXCHAR 10000

void turn_visible(int tv_arr[], int tv_visible[]);
void store_input(int s_arr[]);

int main(void) {
	int storage[MAXCHAR];
	int visible_escape[MAXCHAR];
	int invisible_escape[MAXCHAR];

	store_input(storage);
	turn_visible(storage, visible_escape);
	turn_invisible(visible_escape, invisible_escape);

	printf("Original: %ls\n", storage);
	printf("Visible: %ls\n", visible_escape);

	return 0;
}

// Store input in array
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

// Convert '\n' and '\t' to 2 separate characters,
// then print
// Example: newline character will occupy 2 elements in
// the new array as '\' and 'n'
void turn_visible(int tv_arr[], int tv_visible[]) {
	int tv_i = 0; // counter for tv_arr[]
	int tv_j = 0; // counter for tv_visible[]

	for ( ; tv_arr[tv_i] != '\0'; tv_i++, tv_j++) {
		switch (tv_arr[tv_i]) {
			case '\t' :
				tv_visible[tv_j] = '\\';
				tv_visible[tv_j + 1] = 't';
				tv_j++;
				continue;
			case '\n' :
				tv_visible[tv_j] = '\\';
				tv_visible[tv_j + 1] = 'n';
				tv_j++;
				continue;
			default:
				tv_visible[tv_j] = tv_arr[tv_i];
				continue;
		}
	}

	return;
}

// Convert consecutive '\', 'n' or '\', 't' to '\n' or
// '\t', then store in new array. Print new array.
void turn_invisible(int ti_vis[], int ti_invis[]) {
	
}
