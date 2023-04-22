#include <stdio.h>

/* Print words in input, one per line */
int main(void) {
  int character;
  
  while ( (character = getchar()) != EOF ) {
    if (character == ' ') {
      printf("\n");
    }
    else {
      printf("%c", character);
    }
  }
}