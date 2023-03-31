// Recursion only
// Pass index counter to doubler function

/*
	Variable names:
	<function initial/s><underscore><variable name>
	m_index is a variable in main() named index
*/

#include <stdio.h>

void doubler(int d_array[], int d_index);

int main(void)
{
	int m_index = 0;
	int m_array[] = {1, 2, 3, 4, 5};

	doubler(m_array, m_index);

	return 0;
}

void doubler(int d_array[], int d_index)
{
	if (d_index == 5)
	{
		return;
	}

	d_array[d_index] *= 2;
	printf("%i\n", d_array[d_index]);

	doubler(d_array, d_index + 1);

	return;
}
