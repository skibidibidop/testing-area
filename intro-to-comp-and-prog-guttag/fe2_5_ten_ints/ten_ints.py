# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 10, 2023

Prints the largest odd number from the ten integers
provided by the user.
"""

LIMIT = 10
counter = 1
number = 0
big_odd = 0

print("Enter 10 numbers and I'll print the biggest, odd number.")

while counter <= LIMIT:
    number = int(input(f"Enter integer #{counter}: "))

    if number %2 != 0 and number > big_odd:
        big_odd = number

    counter += 1

if big_odd == 0:
    print("No odd numbers were provided.")
else:
    print(f"The biggest odd number is {big_odd}")

