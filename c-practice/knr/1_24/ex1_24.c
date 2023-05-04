// Check C program for the following syntax errors:
// Unclosed (), [], {}, '', "", /**/
// Incomplete escape sequences

#include <stdio.h>

#define MAXCHAR 10000

void store_input(char storage[]);
void check_input(char stack[], char storage[]);

int main(void) {
	char stack[MAXCHAR];
	char storage[MAXCHAR];

	printf("Checks unclosed (), [], {}, \'\', \"\", ");
	printf("/**/, and incomplete escape sequences.\n");
	printf("Provide C program. Ctrl + d to end input.\n");
	printf("Input:\n");

	store_input(storage);
	check_input(stack, storage);

	printf("Stack: %s\n", stack);

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
	int line = 1;

	for (i = 0, k = 0; storage[k] != '\0'; k++) {
		if (storage[k] == '\n') {
			line++;
		}

		// Detect opening chars
		switch (storage[k]) {
			// Push to stack
			case '(' : case '[' : case '{' :
				stack[i] = storage[k];
				i++;
				continue;
		}

		// Detect single & double quotes
		if (storage[k] == '\'' || storage[k] == '\"') {
			// Pop off the stack
			if (stack[i - 1] == storage[k]) {
				stack[i - 1] = '\0';
				i--;
			}
			// Push to stack
			else {
				stack[i] = storage[k];
				i++;
			}

			continue;
		}

		// Detect comments
		if (storage[k] == '*') {
			// Unclosed /*, push to stack
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
		if (storage[k] == '\\') {
			switch (storage[k + 1]) {
				// Don't do anything if correct
				// escape sequence
				case 'a' : case 'b' : case 'f' :
				case 'n' : case 'r' : case 't' :
				case 'v' : case '\\' : case '?' :
				case '\'' : case '\"' : case '0' :
					continue;
				// Push to stack, can't be
				// popped off
				default :
					stack[i] = '\\';
					i++;
					continue;
			}
		}

		// Detect closing chars
		switch (storage[k]) {
			case ')' : case ']' : case '}' :
				// Pop off the stack
				if (storage[k] == stack[i - 1]) {
					stack[i - 1] = '\0';
					i--;
				}
				// Push to stack, can't be
				// popped off
				else {
					stack[i] = storage[k];
					i++;
				}

				continue;
		}
	}

	stack[i] = '\0';

	return;
}
