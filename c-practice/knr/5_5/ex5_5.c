#include <stdio.h>
#include <string.h>

#define MAXCHAR 10000

void store_input(char *input);
char * strncpy2(char *s, char *ct, int n);
char * strncat2(char *s, char *ct, int n);

int main(void) {
	// Copy
	char copy_this[MAXCHAR];
	char copy_holder[MAXCHAR];
	int copy_n = 0;

	printf("COPIER\n");
	printf("String to copy: ");
	store_input(copy_this);
	printf("No. of characters: ");
	scanf("%i", &copy_n);

	strncpy2(copy_holder, copy_this, copy_n);
	printf("String copied: %s\n\n", copy_holder);

	// Concatenate
	char cat_first[MAXCHAR];
	char cat_second[MAXCHAR];
	int cat_n = 0;

	printf("CONCATENATOR\n");
	printf("First string: ");
	store_input(cat_first);
	printf("Second string: ");
	store_input(cat_second);
	printf("No. of characters from 2nd string to concatenate: ");
	scanf("%i", &cat_n);

	strncat2(cat_first, cat_second, cat_n);
	printf("Concatenated string: %s\n\n", cat_first);

	return 0;
}

void store_input(char *input) {
	char c;

	while ( (c = getchar()) != '\n' ) {
		*input++ = c;
	}

	*input = '\0';

	return;
}

// strncpy(s, ct, n): copy at most n characters of string ct
// to s, return s. Pad with \0 if ct < n characters
char * strncpy2(char *s, char *ct, int n) {
	char *s_start = s;
	char *limit = ct + (n - 1);
	int length = strlen(ct);
	char *padding_start = ct + (length - 1);

	while (ct <= limit) {
		if (ct > padding_start) {
		    *s++ = '\0';
		    ct++;
		}
		else {
		    *s++ = *ct++;
		}
	}

	*s = '\0';

	return s_start;
}

// strncat(s, ct, n): concatenate at most n characters of ct
// to end of s, terminate with \0, return s
char * strncat2(char *s, char *ct, int n) {
	char *s_start = s;
	char *s_end = s + strlen(s); // point to '\0'
	char *limit = ct + (n - 1);
	
	while (ct <= limit) {
		*s_end++ = *ct++;
	}

	*s_end = '\0';

	return s_start;
}

//strncmp(cs, ct, n): compare at most n characters of cs to
// ct, return <0 if cs < ct, 0 if cs == ct, >0 if cs > ct
