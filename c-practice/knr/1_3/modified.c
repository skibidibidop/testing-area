// Modify the temperature conversion program to print a heading
// above the table.

#include <stdio.h>

/* Print Fahrenheit-Celsius table
	for fahr = 0, 20, ..., 300; floating-point version */

int main(void) {
	float fahr, celsius;

	int lower = 0;
	int upper = 300;
	int step = 20;

	char f_head[] = "Fahrenheit";
	char c_head[] = "Celsius";

	printf("%15s %15s\n", f_head, c_head);

	fahr = lower;
	while (fahr <= upper) {
		celsius = (5.0/9.0) * (fahr - 32.0);
		printf("%15.0f %15.1f\n", fahr, celsius);
		fahr = fahr + step;
	}
}
