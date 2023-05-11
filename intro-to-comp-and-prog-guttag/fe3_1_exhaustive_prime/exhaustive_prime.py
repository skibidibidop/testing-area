# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 11, 2023

Using exhaustive enumeration, check if prime.
Input has to be > 2.
Return largest divisor if not.

This is modified code from Figure 3-2.
"""

x = int(input("Enter an integer greater than 2: "))
smallest_divisor = None

for guess in range(2, x):
    if x % guess == 0:
        smallest_divisor = guess
        break

if smallest_divisor != None:
    print(f"Smallest divisor of {x} is {smallest_divisor}")
else:
    print(f"{x} is a prime number.")

