// Convert hex input to decimal, then print
// Allowed input: 0 to 9, a to f, A to F
// Leading 0x or 0X optional

#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>

#define MAXCHAR 1000

bool store_input(char s_input[]);

int main(void) {
	char input[MAXCHAR];

	bool prefix = store_input(input);

	printf("%s\n", input);

	return 0;
}

// Convert input to lowercase, store in array
// Identify if input has 0x prefix
bool store_input(char s_input[]) {
	char s_element;
	int s_i = 0;

	while ( (s_element = getchar()) != '\n' ) {
		s_input[s_i] = tolower(s_element);
		s_i++;
	}

	s_input[s_i++] = '\0';

	if (s_input[0] == '0' && s_input[1] == 'x') {
		return true;
	}

	return false;
}

