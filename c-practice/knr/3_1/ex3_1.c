// Rewrite binsearch() from K & R
// Use only 1 test in the loop instead
//  of 2 tests

#include <stdio.h>

#define MAXCHAR 1000

int binsearch(int x, int v[], int n);

int main(void) {
    int sorted_arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};

    int result = binsearch(5, sorted_arr, 11);
    printf("Location: %i\n", result);

    return 0;
}

int binsearch(int x, int v[], int n) {
    int low, high, mid;

    low = 0;
    high = n - 1;
    mid = (low + high) / 2;

    while (low <= high) {
        mid = (low + high) / 2;

        if (x < v[mid]) {
            high = mid - 1;
        }
        else if (x > v[mid]) {
            low = mid + 1;
        }
        else {
            return mid;
        }
    }

    return -1;
}