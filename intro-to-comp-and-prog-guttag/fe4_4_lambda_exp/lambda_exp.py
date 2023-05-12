# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 12, 2023

Use lambda expression with 2 arguments.
If the second argument is 0, return None.
Otherwise, divide the 1st arg with the 2nd
arg and return the quotient.
"""

print("Let's divide! Remember, we can't divide by 0.")
a = int(input("First number: "))
b = int(input("Second number: "))

c = (lambda x, y: x / y if y != 0 else None)(a, b)

print(f"Answer: {c}")

