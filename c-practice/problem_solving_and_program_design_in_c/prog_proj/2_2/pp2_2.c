/*
 * Author: Mark Beltran
 * Date: May 9, 2023
 *
 * Get power (MW) assuming that 90% of work done by the falling
 * water is converted to electricity
 */

#include <stdio.h>

#define GRAVITY 9.8
#define CUBICM_TO_KG 1000
#define W_TO_MW 1000
#define EFFICIENCY 0.9

void print_details(void);

int main(void) {
	double height;
	double flow;

	print_details();

	printf("Height (in meters): ");
	scanf("\n%lf", &height);
	printf("Flow (in cubic meters): ");
	scanf("\n%lf", &flow);

	double mass = flow * CUBICM_TO_KG;
	double work = mass * GRAVITY * height;

	/* Get 90% of work done by gravity on the water
	 * Output is in watts */
	work *= EFFICIENCY;

	/* Convert watts to Megawatts */
	work /= W_TO_MW;

	printf("Power: %lf MW\n", work);

	return 0;
}

/* Print title and instructions */
void print_details(void) {
	printf("Hydroelectric Power Calculator\n");
	printf("Provide the height of the dam and the flow rate ");
	printf("in cubic meters to get power in MW.\n");

	return;
}

