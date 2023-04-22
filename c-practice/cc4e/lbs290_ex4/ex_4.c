/* Assignment 4 LBS 290 - Fall 1991 - syntax errors */

#include <stdio.h>

int main(void) {
	char c;
	int value1;
	int i;
	float x;

	printf("Hello there and welcome to the program\n");
	i = 10;
	x = 2.50;
	x = x + 1;
 	value1 = 15;
	/* This is a comment */
	printf("This statement should print out, why doesn't it?\n");
	/* And another comment */
	printf("This statement does print out, yay!\n");

	return 0;
}