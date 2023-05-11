# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 11, 2023

Print the sum of all prime numbers from
3 to 999
"""

sum = 0

for num in range(3, 1000, 2):
    checker = 5
    flag = 0

    while (checker * checker) <= num:
        if num % checker == 0 or num % (checker + 2) == 0:
            flag = 1
            break

        checker += 6

    if flag == 1 or num % 3 == 0:
        continue

    sum += num

sum += 3

print(f"Sum: {sum}")

