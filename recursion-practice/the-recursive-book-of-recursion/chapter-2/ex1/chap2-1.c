// Iteratively calculate the sum of the integers from 1 to n

#include <stdio.h>
#include <ctype.h>

int main(void){
	int number = 0;

	printf("Number: ");
	scanf("%i", &number);

	int m_counter;
	int sum = 0;
	for (int m_counter = 1; m_counter <= number; m_counter++){
		sum += m_counter;
	}

	printf("Sum: %i\n", sum);
	return 0;
}
