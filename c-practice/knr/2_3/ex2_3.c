// Convert hex input to decimal, then print
// Allowed input: 0 to 9, a to f, A to F
// Leading 0x or 0X optional

#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>

#define MAXCHAR 1000

void store_input(char s_input[]);
bool check_prefix(char cp_input[]);

int main(void) {
	char input[MAXCHAR];

	store_input(input);
	bool prefix = check_prefix(input);
	verify_input(input, prefix);

	printf("%s\n", input);

	return 0;
}

// Convert input to lowercase, store in array
void store_input(char s_input[]) {
	char s_element;
	int s_i = 0;

	while ( (s_element = getchar()) != '\n' ) {
		s_input[s_i] = tolower(s_element);
		s_i++;
	}

	s_input[s_i++] = '\0';

	return;
}

bool check_prefix(char cp_input[]) {
	if (cp_input[0] == '0' && cp_input[1] == 'x') {
		return true;
	}

	return false;
}

void verify_input(char v_input[], bool v_prefix) {
	if (v_prefix == true) {
		
	}
}
