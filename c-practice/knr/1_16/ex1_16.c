// Taken from the longest line program in KNR
// Revise main, print length of arbitrarily long
// input lines, and as much as possible of the text

#include <stdio.h>

#define MAXLINE 1000 // max input line size

int getline(char line[], int maxline);
void copy(char to[], char from[]);

int main(void) {
	int len; // current line length
	int max; // max length seen so far
	char line[MAXLINE];
	char longest[MAXLINE];

	printf("Hello!\n");

	max = 0;
	while ( (len = getline(line, MAXLINE)) > 0 ) {
		if (len > max) {
			max = len;
			copy(longest, line);
		}
	}
	
	if (max > 0) { //there was a line
		printf("Longest line: %s", longest);
		printf("Length: %d\n", max - 1);
	}

	return 0;
}

// getline: read a line into s, return length
int getline(char s[], int lim) {
	int c;
	int i;

	for (i = 0; i < lim - 1 && (c = getchar()) != EOF && c != '\n'; ++i) {
		s[i] = c;
	}

	if (c == '\n') {
		s[i] = c;
		++i;
	}

	s[i] = '\0';

	return i;
}

// copy: copy "from" into "to": assume to is big enough
void copy(char to[], char from[]) {
	int i = 0;

	while ( (to[i] = from[i]) != '\0') {
		++i;
	}
}

