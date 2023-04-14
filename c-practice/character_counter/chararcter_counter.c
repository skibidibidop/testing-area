#include <stdio.h>
#include <ctype.h>

int main(void){
	printf("Let's count your input: ");

	int m_counter = 0;
	int character;

	while (( character = getchar() ) != EOF){
		if ( !isspace(character) ){
			m_counter++;
		}
	}

	printf("Your input has %i character/s.", m_counter);
	return 0;
}

