// Convert upper case to lower case
// Use conditional expression instead of
// if-else

#include <stdio.h>

#define MAXCHAR 1000
#define CASEGAP 32

void lower(int l_storage[]);

int main(void) {
    int storage[MAXCHAR];

    printf("Input: ");
    lower(storage);
    printf("Converted: %ls\n", storage);

    return 0;
}

void lower(int l_storage[]) {
    int l_char;
    int l_i = 0;

    while ( (l_char = getchar() ) != '\n' ) {
        l_storage[l_i] = (l_char >= 'A' && l_char <= 'Z') ? l_char + CASEGAP :
                                                            l_char;
        l_i++;
    }

    l_storage[l_i] = '\0';

    return;
}