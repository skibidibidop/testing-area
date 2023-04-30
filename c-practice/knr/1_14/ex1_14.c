// Print histogram of character frequencies in input

#include <stdio.h>
#include <stdbool.h>

#define MAXCHAR 10000

int main(void) {
	char storage[MAXCHAR];
	int count[MAXCHAR];

	initialize(count);
	int length = store_input(storage, count);

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
	
}
