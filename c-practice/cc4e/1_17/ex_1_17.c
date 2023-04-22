#include <stdio.h>
#include <string.h>

#define MAXCHAR 1000

void reverse(char r_string[]) ;

int main(void) {
	char character;
	char m_string[MAXCHAR];
	int i = 0;

	while ( (character = getchar()) != EOF ) {
		m_string[i] = character;
		i++;
	}

	m_string[i + 1] = '\0';
	reverse(m_string);

	return 0;
}

void reverse(char r_string[]) {
	for (int j = strlen(r_string) - 2; j >= 0; j--) {
		printf("%c", r_string[j]);
	}

	return;
}