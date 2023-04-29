// Convert Celsius to Fahrenheit
// For 0, 20, ..., 300 Celsius

#include <stdio.h>

#define STEP 20

int main(void) {
	float celsius = 0;
	float fahr;
	char c[] = "Celsius";
	char f[] = "Fahrenheit";
	
	printf("%15s %15s\n", c, f);

	float cels_const = 9.0 / 5.0;
	while (celsius <= 300) {
		fahr = (celsius * cels_const) + 32;
		printf("%15.0f %15.1f\n", celsius, fahr);
		celsius += STEP;
	}

	return 0;
}
