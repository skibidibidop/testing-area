#include <stdio.h>

int main(void) {
	/* Fahrenheit-Celsius table */
	int fahr;
	char celsius[] = "CELSIUS";

	printf("FAHR %9s\n", celsius);
	printf("---------------\n");

	for (fahr = 0; fahr <= 300; fahr = fahr + 40) {
        	printf("%4d %6.1f\n", fahr, (5.0/9.0)*(fahr-32));
	}

	return 0;
}
