// Remove trailing blanks and tabs per line of input
// Delete entirely blank lines

#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>

#define MAXCHAR 10000

int main(void) {
	char character;
	char m_storage[MAXCHAR];
	int m_i = 0;

	printf("***TRAILING SPACE TRIMMER***\n");
	printf("Provide input, then hit enter.\n");
	printf("Ctrl + D to end input phase.\n");
	printf("Input:\n");

	while ( (character = getchar()) != EOF ) {
		if (character == '\n') {
			m_storage[m_i] = '\0';
		}
		else {
			m_storage[m_i] = character;
		}

		m_i++;
	}

	trim_end(m_storage, m_i);
	print_array(m_storage, m_i);

	return 0;
}

void trim_end(char *te_storage, te_length) {
	bool te_trailing;
	char *te_end = te_storage + te_length;

	while (te_end != te_storage) {
		if (*te_end == '\0') {
			te_trailing = true;
		}
		else if (!isblank(*te_end) || *te_end != '\0') {
			te_trailing = false;
		}

		if (te_trailing = true) {
			*te_end = '\0';
		}

		te_end--;
	}
}

void print_array(char *pa_storage, pa_length) {

}
