/*
Expand shorthand notation (alphanum-alphanum or
	-alphanum or alphanum-) to complete list
Allowed input: alphanum and '-'
The whole list is 0-9, then A-Z, then a-z
*/

#include <stdio.h>

#define DIGITLIMIT 58
#define UPPERCASELIMIT 91
#define MAXCHAR 10000
#define PATTERN1 1
#define PATTERN2 2
#define PATTERN3 3

int main(void) {
	char shorthand[MAXCHAR];
	char expanded[MAXCHAR];

	printf("***E X P A N D E R***\n");
	printf("Shorthand format: a-b or a- or -a ");
	printf("or -\na and b stands for any alphanumeric");
	printf(" character.\nNo spaces allowed.\n");
	printf("Input: ");

	store_input(shorthand);
	int flag = verify_input(shorthand);
	expand(shorthand, expanded, flag);

	return 0;
}

void store_input(char shorthand[]) {
	char s_char;

	for (int i = 0; (s_char = getchar()) != '\n'; i++) {
		shorthand[i] = s_char;
	}

	shorthand[++i] = '\0';

	return;
}

int verify_input(char shorthand[]) {
	if (isalnum(shorthand[0]
	
}
