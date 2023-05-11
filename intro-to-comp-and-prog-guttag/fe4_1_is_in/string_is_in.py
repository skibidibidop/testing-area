# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 11, 2023

is_in function checks if a string occurs
in another
"""

def is_in(string1, string2):
    """
    Check if one of the strings occurs
    in the other.
    """

    if string1 in string2 or string2 in string1:
        return True

    return False

def test_is_in():
    """
    Test if the is_in function is behaving
    correctly.
    """

    text_a = "Tester 1!"
    text_b = "Texter 2?"
    text_c = "Test 3."
    text_d = "ter"

    # Test 1
    if is_in(text_a, text_b) == False:
        print("Tester 1, Texter 2. No occurence. OK!")
    else:
        print("Tester 1, Texter 2. No occurrence. ERROR!")

    # Test 2
    if is_in(text_a, text_c) == False:
        print("Tester 1, Test 3. No occurrence. OK!")
    else:
        print("Tester 1, Test 3. No occurrence. ERROR!")

    # Test 3
    if is_in(text_a, text_d) == True:
        print("Tester 1, ter. Hit. OK!")
    else:
        print("Tester 1, ter. Hit. ERROR!")

    # Test 4
    if is_in(text_b, text_d) == True:
        print("Texter 2, ter. Hit. OK!")
    else:
        print("Texter 2, ter. Hit. ERROR!")

    # Test 5
    if is_in(text_b, text_d) == True:
        print("Texter 2, ter. Hit. OK!")
    else:
        print("Texter 2, ter. Hit. ERROR!")

    # Test 6
    if is_in(text_b, text_c) == False:
        print("Texter 2, Test 3. No occurrence. OK!")
    else:
        print("Texter 2, Test 3. No occurrence. ERROR!")

# Main flow
test_is_in()

text_one = input("String 1: ")
text_two = input("String 2: ")

result = is_in(text_one, text_two)

if result == True:
    print("Hit!")
else:
    print("No occurrence.")

