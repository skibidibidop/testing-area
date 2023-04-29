// Count blanks, tabs, newlines

#include <stdio.h>

int main(void) {
	int input;
	int blank = 0;
	int tab = 0;
	int nl = 0;

	printf("***Blank Counter***\n");
	printf("Provide input. Ctrl + d to end.\n");
	printf("Input:\n");

	while ( (input = getchar()) != EOF ) {
		if (input == ' ') {
			blank++;
		}
		else if (input == '\t') {
			tab++;
		}
		else if (input == '\n') {
			nl++;
		}
	}

	printf("Blanks: %i\n", blank);
	printf("Tabs: %i\n", tab);
	printf("Newlines: %i\n", nl);

	return 0;
}
