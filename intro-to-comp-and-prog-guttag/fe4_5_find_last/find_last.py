# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 12, 2023

Find the last occurrence of specified
substring in string.
"""

def find_last(full, sub):
    """
    full & sub are non-empty strings
    Returns the index of the last occurrence of
    sub in full.
    Returns None if sub does not occur in full.
    """

    f_index = len(full) - 1
    s_index = len(sub) - 1
    reset = s_index

    while True:
        if full[f_index] == sub[s_index]:
            s_index -= 1
        else:
            s_index = reset

        f_index -= 1

        if s_index < 0 or f_index < 0:
            break

    if s_index < 0: # Match
        f_index += 1
        return f_index

    return None

full_str = input("Provide original string: ")
sub_str = input("Provide substring: ")

result = find_last(full_str, sub_str)

if result == None:
    print("No match.")
else:
    print(f"Match at index {result} of the original string.")

