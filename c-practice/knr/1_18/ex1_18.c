// Remove trailing blanks and tabs per line of input
// Delete entirely blank lines

#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>

#define MAXCHAR 10000

void trim_end(char *te_storage, int te_length);
void print_array(char *pa_storage, int pa_length);

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

void trim_end(char *te_storage, int te_length) {
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

	return;
}

void print_array(char *pa_storage, int pa_length) {
	char *pa_prev;

	for (int pa_i = 0; pa_i < pa_length; pa_i++) {
		pa_storage += pa_i;
		pa_prev = pa_storage - 1;
		
		if (*pa_storage == '\0' && *pa_prev != '\0') {
			printf("\n");
		}

		if (*pa_storage != '\0') {
			printf("%c", *pa_storage);
		}
	}

	return;
}
