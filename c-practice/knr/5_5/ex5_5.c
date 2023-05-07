#include <stdio.h>
#include <string.h>

#define MAXCHAR 10000

void store_input(char *input);
char *strncpy2(char *s, char *ct, int n);

int main(void) {
    char copy_this[MAXCHAR];
    char copy_holder[MAXCHAR];
    int copy_n = 0;

    printf("COPIER\n");
    printf("String to copy: ");
    store_input(copy_this);
    printf("No. of characters: ");
    scanf("%i", &copy_n);
    char *copied = strncpy2(copy_holder, copy_this, copy_n);
    printf("String copied: %s\n\n", copied);
    
    // char cat_first[MAXCHAR];
    // char cat_second[MAXCHAR];
    // int cat_n = 0;


    // printf("CONCATENATOR\n");
    // char *concatenated = strncat(

    return 0;
}

void store_input(char *input) {
    char c;

    while ( (c = getchar()) != '\n') {
        *input++ = c;
    }

    *input = '\0';

    return;
}

// strncpy(s, ct, n): copy at most n characters of string ct
// to s, return s. Pad with \0 if ct < n characters
char *strncpy2(char *s, char *ct, int n) {
    char *limit = ct + n;
    int length = strlen(ct);
    char *padding_start = ct + length;

    while (ct <= limit) {
        if (n > length && ct > padding_start) {
            *s++ = '\0';
        }
        else {
            *s++ = *ct++;
        }
    }

    *s = '\0';

    return s;
}

// strncat(s, ct, n): concatenate at most n characters of ct
// to end of s, terminate with \0, return s

//strncmp(cs, ct, n): compare at most n characters of cs to
// ct, return <0 if cs < ct, 0 if cs == ct, >0 if cs > ct