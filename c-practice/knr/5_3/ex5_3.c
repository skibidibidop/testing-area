// strcat(s, t) using pointers
// Append string t to string s

#include <stdio.h>

void strcat2(char *s, char *t);

int main(void) {
    char s[] = "string1";
    char t[] = "string2";

    strcat2(s, t);
    printf("%s\n", s);

    return 0;
}

void strcat2(char *s, char *t) {
    while (*s != '\0') {
        s++;
    }

    while ( (*s++ = *t++) != '\0');

    return;
}

/* Original strcat from Chapter 2
void strcat(char s[], char t[]) {
    int i = 0;
    int j = 0;

    while (s[i] != '\0') {
        i++;
    }

    while ( (s[i++] = t[j++]) != '\0' );

    return;
}
*/