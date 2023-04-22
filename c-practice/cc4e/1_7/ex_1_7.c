#include <stdio.h>
#include <ctype.h>

int main(void) {
	int previous = 0;
	int character;

	while ( (character = getchar()) != EOF ) {
		if ( !isspace(previous) ) {
			printf("%c", character);
		}
		else if ( isspace(previous) && !isspace(character) ) {
			printf("%c", character);
		}

		previous = character;
	}

	return 0;
}
