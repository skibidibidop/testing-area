#include <stdio.h>
#define MAXCHAR 1000

int main(void) {
  	char character;
  	char output[MAXCHAR];
    
  	printf("Enter line\n");
  
  	int i = 0;
  	while ( (character = getchar()) != EOF ) {
		output[i] = character;
		i++;
    }

	output[i + 1] = '\0';
  	printf("Line: %s\n", output);

    return 0;
}