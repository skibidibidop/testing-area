// Return 1 if string t occurs at the end of string s
// Return 0 otherwise

#include <stdio.h>

#define MAXCHAR 10000

int main(void) {
    char s[MAXCHAR];
    char t[MAXCHAR];

    printf("Original: ");
    int length_s = store_input(s);
    printf("Search: ");
    int length_t = store_input(t);

    return 0;
}

int store_input(char *input) {
    char c;
    int length = 0;

    while ( (c = getchar()) != '\n') {
        *input = c;
        input++;
        length++;
    }

    *(++input) = '\0';

    return length;
}