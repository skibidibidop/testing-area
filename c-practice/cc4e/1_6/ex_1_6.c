#include <stdio.h>

int main(void) {
	/* count new lines and blanks in input */
	int c;
	int nl = 1;
	int blanks = 0;

	while ( (c = getchar()) != EOF ) {
		if (c == '\n') {
			nl++;
		}

		if (c == ' ') {
			blanks++;
		}
	}

	printf("%d %d\n", blanks, nl);
	return 0;
}
