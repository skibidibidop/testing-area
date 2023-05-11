# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 11, 2023

Function multi:
Take 2 arguments (1 optional).
If 1 argument, print that. If 2
arguments, print their product.
"""

def mult(x, y = 1):
    if y == "":
        print(x)
    else:
        print(f"{x * int(y)}")

# Main flow
op1 = int(input("Enter a number(required): "))
op2 = input("Enter an optional number. Enter to skip: ")

mult(op1, op2)

