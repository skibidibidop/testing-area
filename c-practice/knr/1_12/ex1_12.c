// Print input one line per word

#include <stdio.h>

int main(void) {
	int character;

	while (( character = getchar() ) != EOF) {
		if (character == ' ') {
			printf("\n");
		}
		else {
			printf("%c", character);
		}
	}

	return 0;
}
