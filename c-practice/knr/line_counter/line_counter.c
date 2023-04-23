#include <stdio.h>

int main(void){
	int m_counter = 0;
	int m_input;

	printf("Input: ");

	while ( ( m_input = getchar() ) != EOF ){
		if (m_input == '\n'){
			m_counter++;
		}
	}

	printf("No. of lines: %i\n", m_counter);

	return 0;
}

