// Write a function that reverses a character string
// Reverse input one line at a time

#include <stdio.h>

#define MAXCHAR 10000

int main(void) {
    printf("***STRING REVERSER***\n");
    printf("Provide string to reverse. ");
    printf("Ctrl + d to exit.\nInput:\n");

    int i = 0;
    char character;
    char arr[MAXCHAR];

    while ( (character = getchar()) != EOF ) {
        arr[i] = character;

        if (character == '\n') {
            for (i = i - 1; i >= 0; i--) {
                printf("%c", arr[i]);
            }

            printf("\n");
        }

        i++;
    }

    return 0;
}