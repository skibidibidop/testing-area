// Copy input to output, replace tab with '\t',
// backspace with '\b', backslash with '\\'

#include <stdio.h>

int main(void) {
	int character;

	printf("Input: ");

	while ( (character = getchar()) != EOF ) {
		if (character == '\t') {
			printf("\\t");
		}
		else if (character == '\b') {
			printf("\\b");
		}
		else if (character == '\\') {
			printf("\\");
		}
		else {
			printf("%c", character);
		}
	}

	return 0;
}
