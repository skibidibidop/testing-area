// Return position of rightmost occurrence
// 	of pattern[] in input[]
// Return -1 if no occurrence

#include <stdio.h>
#include <string.h>

#define MAXCHAR 10000

void get_pattern(char pattern[]);
void get_input(char input[]);
int strrindex(char input[], char pattern[]);
void print_result(int location);

int main(void) {
	char pattern[MAXCHAR];
	char input[MAXCHAR];

	printf("PATTERN MATCH (REVERSE)\n\n");
	printf("Finds the first occurrence of a specified ");
	printf("pattern nearest to the end of your input.\n");

	printf("Pattern: ");
	get_pattern(pattern);
	printf("Input: ");
	get_input(input);

	int location = strrindex(input, pattern);
	print_result(location);

	return 0;
}

void get_pattern(char pattern[]) {
	char c;
	int i;

	for (i = 0; (c = getchar()) != '\n'; i++) {
		pattern[i] = c;
	}

	pattern[++i] = '\0';

	return;
}

void get_input(char input[]) {
	char c;
	int i;

	for (i = 0; (c = getchar()) != '\n'; i++) {
		input[i] = c;
	}

	input[++i] = '\0';

	return;
}

int strrindex(char input[], char pattern[]) {
	int i = strlen(input) - 1;
	int j = strlen(pattern) - 1;
	int k = j;

	for ( ; i >= 0; i--) {
		if (input[i] == pattern[j]) {
			j--;
		}
		else {
			j = k;
		}

		if (j == 0) {
			return i;
		}
	}

	return -1;
}

void print_result(int location) {
	if (location == -1) {
		printf("Can't find the pattern in your ");
		printf("input.\n");

		return;
	}
	else {
		printf("Pattern nearest the end of input ");
		printf("located at index %d.\n", location);
	}

	return;
}
