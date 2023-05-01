// Print ranges of char, short, int, long,
// 	both signed and unsigned

#include <stdio.h>
#include <limits.h>

int main(void) {
	char smax[] = "Signed Max";
	char smin[] = "Signed Min";
	char umax[] = "Unsigned Max";
	char t[] = "Type";

	printf("*** LIMITS ***\n\n");
	printf("%5s %25s %25s %25s\n", t, umax, smax, smin);
	printf("%5s %25u %25i %25i\n", "char", UCHAR_MAX, SCHAR_MAX,
		SCHAR_MIN);
	printf("%5s %25u %25i %25i\n", "short", USHRT_MAX, SHRT_MAX,
		SHRT_MIN);
	printf("%5s %25u %25i %25i\n", "int", UINT_MAX, INT_MAX,
		INT_MIN);
	printf("%5s %25lu %25li %25li\n", "long", ULONG_MAX,
		LONG_MAX, LONG_MIN);

	return 0;
}
