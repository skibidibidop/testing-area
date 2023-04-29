// Modify the temperature conversion program to print the
// 	table in reverse order. That is, from 300 degrees
// 	to 0.

#include <stdio.h>

#define STEP 20

// Fahrenheit to Celsius
int main(void) {
	float fahr = 300.0;
	float cels;
	char f[] = "Fahrenheit";
	char c[] = "Celsius";

	printf("%15s %15s\n", f, c);

	float fahr_const = 5.0 / 9.0;
	while (fahr >= 0) {
		cels = (fahr - 32.0) * fahr_const;
		printf("%15.0f %15.2f\n", fahr, cels);
		fahr -= STEP;
	}

	return 0;
}
