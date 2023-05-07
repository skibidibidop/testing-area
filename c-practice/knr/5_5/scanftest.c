#include <stdio.h>

#define MAXCHAR 10000

int main(void) {
    int n = 0;

    scanf("%i", &n);
    printf("%i, %d, %c\n", n, n, n);

    char s[MAXCHAR];

    scanf("%s", s);
    printf("%s\n", s);

    return 0;
}
