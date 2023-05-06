// strcat(s, t) using pointers
// Append string to to string s

#include <stdio.h>

#define MAXCHAR 10000

int main(void) {

}

/* Original strcat from Chapter 2
void strcat(char s[], char t[]) {
    int i = 0;
    int j = 0;

    while (s[i] != '\0') {
        i++;
    }

    while ( (s[i++] = t[j++] != '\0') );

    return;
}
*/