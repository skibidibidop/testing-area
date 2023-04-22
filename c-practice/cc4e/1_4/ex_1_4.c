#include <stdio.h>

int main(void) {
	/* Fix this to be Celsius-Fahrenheit table */
	int celsius;
	float fahrenheit;

	for (celsius = 0; celsius <= 100; celsius += 20) {
		fahrenheit = ( celsius * (9.0 / 5.0) ) + 32.0;
		printf("%4d %6.1f\n", celsius, fahrenheit);
	}

	return 0;
}
