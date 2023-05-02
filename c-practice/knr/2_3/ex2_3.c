// Convert hex input to decimal, then print
// Allowed input: 0 to 9, a to f, A to F
// Leading 0x or 0X optional

#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>

#define MAXCHAR 1000
#define PREFIXED 1
#define INVALID 2

int verify_input(char s_input[]);
void htoi(char h_input[]);

int main(void) {
	char input[MAXCHAR];

	int hex_prefix = verify_input(input);
	htoi(input, hex_prefix);

	return 0;
}

// Convert input to lowercase, store in array
// Identify if prefixed, not prefixed, or invalid
int verify_input(char s_input[]) {
	char s_element;
	int s_i = 0;
	int s_status;

	// Set to 0 to avoid garbage val problems
	s_input[0] = '0';
	s_input[1] = '0';

	while ( (s_element = getchar()) != '\n' ) {
		s_input[s_i] = tolower(s_element);

		if (s_input[0] == '0' && s_input[1] == 'x') {
			s_status = PREFIXED;
		}
		else if ( s_input[0] == '0' && s_input[1] != 'x' &&
			!isdigit(s_input[1]) ) {
			return INVALID;
		}

		if ( s_i >= 2 && !isdigit(s_input[s_i]) ) {
			if ( s_input[s_i] < 'a' ||
				(s_input[s_i] > 'f' &&
				 s_input[s_i] != 'x') ) {
			return INVALID;
			}
		}

		s_i++;
	}

	s_input[s_i++] = '\0';

	return s_status;
}

// Convert hex to decimal, then print
void htoi(char h_input[], int h_prefix) {
	long h_decimal = 0;
	int h_length = strlen(h_input);
	double h_base = 16.0;
	double h_place = 0.0;
	double h_multiplier = pow(h_base, h_place);
	int h_i = 0;

	if (h_prefix == PREFIXED) {
		// Skip first 2 elements (0 and x) in array
		h_i = 2;
	}

	for ( ; h_input[h_i] != '\0'; h_i++) {

	}

	return;
}
