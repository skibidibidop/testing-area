// Print histogram of character frequencies in input

#include <stdio.h>
#include <stdbool.h>

#define MAXCHAR 10000

int main(void) {
	char storage[MAXCHAR];
	int count[MAXCHAR];

	printf("Provide input. Ctrl + d to end.\n");
	printf("Input:\n");

	initialize(count);
	int length = store_input(storage, count);
	print_histogram(storage, count, length);

	return 0;
}

// Initialize all elements to 0
void initialize(int i_count[]) {
	for (int i_i = 0; i_i < MAXCHAR; i_i++) {
		i_count[i_i] = 0;
	}

	return;
}

// Store characters and character count in separate
// arrays. Return character array length
int store_input(char s_storage[], int s_count[]) {
	int s_char;
	int s_length = 0;
	bool s_existing;

	while ( (s_char = getchar()) != EOF ) {
		s_length++;
		s_existing = false;

		for (int s_i = 0; s_i < s_length; s_i++) {
			if (s_storage[s_i] == s_char) {
				s_count[s_i]++;
				s_existing = true;
			}
		}

		if (s_existing == false) {
			s_storage[s_length] = s_char;
			s_count[s_length]++;
		}
	}

	return s_length;
}

void print_histogram(char p_storage[], int p_count[], int p_length) {
	printf("Frequency of each character in the input:\n");
	for (int p_i = 1; p_i <= p_length; p_i++) {
		printf("%3c  :", p_storage[p_i]);
		
		for (int p_j = 0; p_j < p_count[p_i]; p_j++) {
			printf("|");
		}

		printf("\n");
	}

	return;
}
