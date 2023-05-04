/*
Expand shorthand notation (alphanum-alphanum or
	-alphanum or alphanum-) to complete list
Allowed input: alphanum and '-'
The whole list is 0-9, then A-Z, then a-z
*/

#include <stdio.h>
#include <ctype.h>

#define DIGITLIMIT 58
#define UPPERCASELIMIT 91
#define MAXCHAR 10000
#define PATTERN1 1
#define PATTERN2 2
#define PATTERN3 3
#define PATTERN4 4
#define INVALID 5

void store_input(char shorthand[]);
int verify_input(char shorthand[]);
void expand(char shorthand[], char expanded[], int flag);

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

	if (flag == INVALID) {
		printf("Invalid input.\n");
		return INVALID;
	}

	expand(shorthand, expanded, flag);
	printf("Expanded: %s\n", expanded);

	return 0;
}

void store_input(char shorthand[]) {
	char s_char;
	int i;

	for (i = 0; (s_char = getchar()) != '\n'; i++) {
		shorthand[i] = s_char;
	}

	shorthand[++i] = '\0';

	return;
}

int verify_input(char shorthand[]) {
	if ( ( isalnum(shorthand[0]) && shorthand[1] == '-' &&
		isalnum(shorthand[2]) ) &&
		(shorthand[0] < shorthand[2]) ) {
		return PATTERN1;
	}
	else if (shorthand[0] == '-' && isalnum(shorthand[1]) &&
		 shorthand[2] == '\0') {
		return PATTERN2;
	}
	else if (isalnum(shorthand[0]) && shorthand[1] == '-' &&
		 shorthand[2] == '\0') {
		return PATTERN3;
	}
	else if (shorthand[0] == '-' && shorthand[1] == '\0') {
		return PATTERN4;
	}

	return INVALID;
}

void expand(char shorthand[], char expanded[], int flag) {
	char low, high;
	int i, j;

	if (flag == PATTERN1) {
		low = shorthand[0];
		high = shorthand[2];
	}
	else if (flag == PATTERN2) {
		low = '0';
		high = shorthand[1];
	}
	else if (flag == PATTERN3) {
		low = shorthand[0];
		high = 'z';
	}
	else if (flag == PATTERN4) {
		low = '0';
		high = 'z';
	}

	for (i = low, j = 0; i <= high; i++, j++) {
		if (i == DIGITLIMIT) {
			i = 'A';
		}
		else if (i == UPPERCASELIMIT) {
			i = 'a';
		}

		expanded[j] = i;
	}

	expanded[++j] = '\0';

	return;
}
