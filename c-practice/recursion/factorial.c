// Get factorial of provided number

#include <stdio.h>

int factorial(int f_num);

int main(void)
{
	int m_num;
	
	printf("Number: ");
	scanf("%i", &m_num);

	int m_fact = factorial(m_num);
	printf("%i\n", m_fact);

	return 0;
}

int factorial(int f_num)
{
	printf("%i\n", f_num);
	if (f_num == 1)
	{
		return f_num;
	}
	
	f_num *= factorial(f_num - 1);

	return f_num;
}
