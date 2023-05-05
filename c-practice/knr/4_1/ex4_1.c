// Return position of rightmost occurrence
// 	of pattern[] in input[]
// Return -1 if no occurrence

#include <stdio.h>
#include <string.h>

#define MAXCHAR 10000

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

	return 0;
}
