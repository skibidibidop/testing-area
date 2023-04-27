/*
Put string input in array
Replace strings of blanks w/ min. no. of \t & - to achieve
	the same spacing. Use the same TABSTOP (8) in 1-20
If no. of consecutive spaces >= TABSTOP
	no. of \\t to print = TABSTOP / 8
		The printed \t is a representation of an
		actual tab which is 8 characters wide
	no. of - to print  = TABSTOP % 8
*/

#include <stdio.h>

#define MAXCHAR 10000
#define TABSTOP 8

int main(void) {
	int arr[MAXCHAR];
	int character;

	while ( (character = getchar()) != EOF ) {

	}
}
