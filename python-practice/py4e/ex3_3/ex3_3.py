# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 13, 2023

Write a program to prompt for a score between 0.0
and 1.0. If the score is out of range, print an error.
If the score is between 0.0 and 1.0, print a grade
using the following table:
Score Grade
>= 0.9  A
>= 0.8  B
>= 0.7  C
>= 0.6  D
< 0.6   F
If the user enters a value out of range, print a
suitable error message and exit.
"""

score = float(input("Enter score between 0.0 and 1.0: "))

if score >= 0.9 and score < 1.0:
    print("A")
elif score >= 0.8 and score < 0.9:
    print("B")
elif score >= 0.7 and score < 0.8:
    print("C")
elif score >= 0.6 and score < 0.7:
    print("D")
elif score < 0.6:
    print("F")
else:
    print("Provide a score between 0.0 and 1.0.")

