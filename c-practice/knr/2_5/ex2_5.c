// If a character from string2 matches a character from string1 for
// 	the first time, return the location of the element from
// 	string1
// Return -1 if no matches

#include <stdio.h>

#define MAXCHAR 1000

void store_input(char si_arr[]);
void get_firstmatch(char gf_input[], char gf_ref[], int gf_loc[]);
void print_locations(char pl_input[], int pl_loc[]);

int main(void) {
	char to_process[MAXCHAR];
	char reference[MAXCHAR];
	int locations[MAXCHAR];

	printf("***MATCH LOCATOR***\n");
	printf("Input reference: ");
	store_input(reference);
	printf("Input string for processing: ");
	store_input(to_process);

	get_firstmatch(to_process, reference, locations);
	print_locations(to_process, locations);

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

void get_firstmatch(char gf_input[], char gf_ref[], int gf_loc[]) {
	int gf_i;
	int gf_j;

	for (gf_i = 0; gf_input[gf_i] != '\0'; gf_i++) {
		for (gf_j = 0; gf_ref[gf_j]; gf_j++) {
			if (gf_input[gf_i] == gf_ref[gf_j]) {
				gf_loc[gf_i] = gf_j;
				break;
			}

			gf_loc[gf_i] = -1;
		}
	}

	return;
}

void print_locations(char pl_input[], int pl_loc[]) {
	printf("%15s %15s\n", "Character", "Index # in reference");

	for (int pl_i = 0; pl_input[pl_i] != '\0'; pl_i++) {
		printf("%15c %15i\n", pl_input[pl_i], pl_loc[pl_i]);
	}

	printf("\n-1: character not found in reference.\n");

	return;
}
