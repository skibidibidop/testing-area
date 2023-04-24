// Print all input lines longer than 80 characters

#include <stdio.h>

#define MAXCHAR 10000

void out_long(char o_storage[], int store_size);

int main(void) {
	char m_input;
	char m_storage[MAXCHAR];
	int m_i = 0;

	printf("Input:\n");

	while ( (m_input = getchar()) != EOF ) {
		if (m_input == '\n') {
			m_storage[m_i] = '\0';
		}
		else {
			m_storage[m_i] = m_input;
		}

		m_i++;
	}

	out_long(m_storage, m_i);

	return 0;
}

void out_long(char o_storage[], int store_size) {
	int o_length = 0;
	int o_indexreset = 0;

	for (int o_i = 0; o_i < store_size; o_i++) {
		o_length++;

		if (o_storage[o_i] == '\0' && o_length > 80) {
			o_indexreset = o_i - (o_length - 1);
			printf("%s", o_storage[o_indexreset]); // starting in the middle of string with %s
							       // is not working
			o_length = 0;
		}
		else if (o_storage[o_i] == '\0' && o_length <= 80) {
			o_length = 0;
		}
	}

	return;
}
