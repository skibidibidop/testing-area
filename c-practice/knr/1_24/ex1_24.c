// Check C program for the following syntax errors:
// Unclosed (), [], {}, '', "", /**/
// Incomplete escape sequences

#include <stdio.h>

#define MAXCHAR 10000

int main(void) {
	char stack[MAXCHAR];
	char storage[MAXCHAR];

	store_input(storage);
	check_input(stack);

	return 0;
}

void store_input(char storage[]) {
	char si_char;
	int i = 0;

	while ( (si_char = getchar()) != EOF ) {
		storage[i] = si_char;
		i++;
	}

	storage[i] = '\0';

	return;
}

void check_input(char stack[]) {
	char ci_char;
	char prev;
	int i;
	int j;

	for (i = 0; (ci_char = getchar()) != EOF; i++) {
		j = i - 1;

		// Detect opening chars
		switch (ci_char) {
			case '\\' : case '(' :
			case '[' : case '{' :
				stack[i] = ci_char;
				continue;
		}

		// Detect chars that can be closed by
		// identical char
		if (ci_char == ''' || c_char == '"') {
			if (stack[j] == ci_char) {
				stack[j] = '\0';
				i -= 2;
				continue;
			}
			else {
				stack[i] = ci_char;
				continue;
			}
		}

		// Detect comments
		if (ci_char == '*') {

		}
		// Detect closing chars
		switch (ci_char) {
			case '
		}
	}
}
