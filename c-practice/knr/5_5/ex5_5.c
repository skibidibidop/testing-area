#include <stdio.h>

#define MAXCHAR 10000

int main(void) {
    char copy_this[MAXCHAR];
    char copy_holder[MAXCHAR];
    int copy_n = 0;

    printf("COPIER\n");
    printf("String to copy: ");
    store_input(copy_this);
    printf("No. of characters: ");
    scanf("%i", &copy_n);
    char *copied = strncpy(copy_holder, copy_this, copy_n);
    printf("String copied: %s\n\n", copied);
    
    char cat_first[MAXCHAR];
    char cat_second[MAXCHAR];
    int cat_n = 0;


    printf("CONCATENATOR\n");
    char *concatenated = strncat()
    return 0;
}

// strncpy(s, ct, n): copy at most n characters of string ct
// to s, return s. Pad with \0 if ct < n characters

// strncat(s, ct, n): concatenate at most n characters of ct
// to end of s, terminate with \0, return s

//strncmp(cs, ct, n): compare at most n characters of cs to
// ct, return <0 if cs < ct, 0 if cs == ct, >0 if cs > ct