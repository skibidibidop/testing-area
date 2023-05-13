# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 13, 2023

Take 2 lists of same length.
Raise each element of list 1 to the power
of the element in the same index. 
Print sum of all raised elements.
"""

def raise_sum_all(list1, list2):
    """
    list1 and list2 are lists of the same length containing
    numbers. Returns the sum of raising each element in list1
    to the power of the element in the same index in list2.
    """

    sum = 0
    for i in map(lambda base, pow: base**pow, list1, list2):
        sum += i

    return sum

total = raise_sum_all([3,5], [3,2])
print(total)
