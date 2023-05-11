# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 11, 2023

is_in function checks if a string occurs
in another
"""

def is_in(string1, string2):
    """ Check if one of the strings occurs
        in the other."""

    if string1 in string2 or string2 in string1:
        return True

    return False

text_one = input("String 1: ")
text_two = input("String 2: ")

result = is_in(text_one, text_two)

if result == True:
    print("One of the strings occurs in the other.")
else:
    print("These strings don't occur in each other.")

