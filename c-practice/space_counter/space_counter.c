#include <stdio.h>
#include <ctype.h>

int main(void){
	int space_count;
	int character;

	while ( ( character = getchar() ) != EOF ){
		if ( isspace(character) ){
			space_count++;
		}
	}

	printf("Spaces: %i\n", space_count);
	return 0;
}
