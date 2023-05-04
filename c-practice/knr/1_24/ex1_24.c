// Check C program for the following syntax errors:
// Unclosed (), [], {}, '', "", /**/
// Incomplete escape sequences

#include <stdio.h>

#define MAXCHAR 10000

int main(void) {
	char stack[MAXCHAR];
	char storage[MAXCHAR];

	store_input(storage);
	check_input(stack, storage);

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

void check_input(char stack[], char storage[]) {
	int i; // stack counter
	int k; // storage counter

	for (i = 0, k = 0; storage[k] != '\0'; k++) {
		// Detect opening chars
		switch (storage[k]) {
			case '(' : case '[' : case '{' :
				stack[i] = storage[k];
				i++;
				continue;
		}

		// Detect single & double quotes
		if (storage[k] == ''' || storage[k] == '"') {
			if (stack[i - 1] == storage[k]) {
				stack[i - 1] = '\0';
				i--;
			}
			else {
				stack[i] = storage[k];
				i++;
			}

			continue;
		}

		// Detect comments
		if (storage[k] == '*') {
			// Unclosed /*, add to stack
			if (storage[k - 1] == '/') {
				stack[i] = '*';
				i++;
			}
			// Pop off the stack
			else if (storage[k + 1] == '/' &&
				 stack[i - 1] == '*') {
				stack[i - 1] = '\0';
				i--;
			}
			// Unclosed */, can't be popped
			// off the stack
			else if (storage[k + 1] == '/' &&
				 stack[i - 1] != '*') {
				stack[i] = '/';
				i++;
			}

			continue;
		}

		// Detect escape sequences

		// Detect closing chars
		switch (storage[k]) {
			case '
		}
	}
}
