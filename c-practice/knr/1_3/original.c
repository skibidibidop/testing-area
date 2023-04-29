// Original temperature conversion program from The C Programming
// Language (2nd Edition)

#include <stdio.h>

/* Print Fahrenheit-Celsius table
	for fahr = 0, 20, ..., 300; floating-point version */

int main(void) {
	float fahr, celsius;
	int lower, upper, step;

	lower = 0;
	upper = 300;
	step = 20;

	fahr = lower;
	while (fahr <= upper) {
		celsius = (5.0/9.0) * (fahr - 32.0);
		printf("%3.0f %6.1f\n", fahr, celsius);
		fahr = fahr + step;
	}
}
