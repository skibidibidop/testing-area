#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAXCHAR 10000

void store_input(char *input);
int store_num(char *num);
char * strncpy2(char *s, char *ct, int n);
char * strncat2(char *s, char *ct, int n);
int strncmp2(char *cs, char *ct, int n);
void print_comp_result(int result, int comp_n, char *cs, char *ct);

int main(void) {
	// Copy
	char copy_this[MAXCHAR];
	char copy_holder[MAXCHAR];
	char copy_num[MAXCHAR];

	printf("COPIER\n");
	printf("String to copy: ");
	store_input(copy_this);
	printf("No. of characters: ");
	int copy_n = store_num(copy_num);

	strncpy2(copy_holder, copy_this, copy_n);
	printf("String copied: %s\n\n", copy_holder);

	// Concatenate
	char cat_first[MAXCHAR];
	char cat_second[MAXCHAR];
	char cat_num[MAXCHAR];

	printf("CONCATENATOR\n");
	printf("First string: ");
	store_input(cat_first);
	printf("Second string: ");
	store_input(cat_second);
	printf("No. of characters from 2nd string to concatenate: ");
	int cat_n = store_num(cat_num);

	strncat2(cat_first, cat_second, cat_n);
	printf("Concatenated string: %s\n\n", cat_first);

	// Compare
	char comp_first[MAXCHAR];
	char comp_second[MAXCHAR];
	char comp_num[MAXCHAR];

	printf("COMPARER\n");
	printf("First string: ");
	store_input(comp_first);
	printf("Second string: ");
	store_input(comp_second);
	printf("Number of characters to compare: ");
	int comp_n = store_num(comp_num);

	int comp_result = strncmp2(comp_first, comp_second, comp_n);
	print_comp_result(comp_result, comp_n, comp_first, comp_second);

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

// First string input for Concatenator is being skipped
// when using scanf
int store_num(char *num) {
	char *n_start = num;
	char n;

	while ( (n = getchar()) != '\n' ) {
		*num++ = n;
	}

	*num = '\0';

	return atoi(n_start);
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
int strncmp2(char *cs, char *ct, int n) {
	char *limit1 = cs + (n - 1);
	char *limit2 = ct + (n + 1);
	int result = 0;

	while (cs <= limit1 && ct <= limit2) {
		result = *cs - *ct;
		cs++;
		ct++;
	}

	return result;
}

void print_comp_result(int result, int comp_n, char *cs, char *ct) {
	if (result < 0) {
		printf("The first %i characters of %s ", comp_n, cs);
		printf("& %s are the same.\n", ct);
	}
	else {
		printf("The first %i characters of %s ", comp_n, cs);
		printf("& %s are different.\n", ct);
	}

	return;
}
