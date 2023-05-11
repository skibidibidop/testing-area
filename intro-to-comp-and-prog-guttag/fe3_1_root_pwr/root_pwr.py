# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 11, 2023

Check if any integer raised to the power
of 2, 3, 4, or 5 will result to the user's
input
"""

num = int(input("Enter an integer: "))
# Starting root at 2 since
# 0 raised to any power is 0 and
# 1 raised to any power is 1
root = 2
# 1 < pwr < 6 according to the finger exercise
ans = 0

while not ans >= num:
    for pwr in range(2, 6):
        ans = root**pwr

        if ans >= num:
            break

    root += 1

if ans == num:
    print(f"{root - 1} raised to {pwr} is {num}")
else:
    print("No integer raised to the power of 2, 3, 4,",
            "or 5 will result to your number")

