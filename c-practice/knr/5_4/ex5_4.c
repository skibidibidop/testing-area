// Return 1 if string t occurs at the end of string s
// Return 0 otherwise

#include <stdio.h>

#define MAXCHAR 10000

int store_input(char *input);
int strend(char *s, char *t, int len_s, int len_t);
void print_result(int result, char *s, char *t);

int main(void) {
    char s[MAXCHAR];
    char t[MAXCHAR];

    printf("Original: ");
    int len_s = store_input(s);
    printf("Search: ");
    int len_t = store_input(t);

    int result = strend(s, t, len_s, len_t);

    print_result(result, s, t);

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

int strend(char *s, char *t, int len_s, int len_t) {
    char *s_end = s + len_s;        // point to s terminator
    char *t_end = t + len_t;        // point to t terminator

    while (t_end >= t) {
        if (*t_end != *s_end) {
            return 0; // t does not occur at end of s
        }

        s_end--;
        t_end--;
    }

    return 1; // t occurs at end of s
}

void print_result(int result, char *s, char *t) {
    if (result == 0) {
        printf("%s does not occur at the end of %s.\n", t, s);
    }
    else {
        printf("%s can be found in the end of %s.\n", t, s);
    }

    return;
}