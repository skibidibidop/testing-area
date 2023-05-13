# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 13, 2023

Write a program to prompt the user for hours and rate per hour using
input to compute gross pay. Pay the hourly rate for the hours up to
40 and 1.5 times the hourly rate for all hours worked above 40 hours.
Use 45 hours and a rate of 10.50 per hour to test the program
(the pay should be 498.75). You should use input to read a string
and float() to convert the string to a number. Do not worry about
error checking the user input - assume the user types numbers properly.
"""

hrs = float(input("Enter Hours: "))
rate = float(input("Enter rate: "))
ot_rate = rate * 1.5
FULL = 40

excess = hrs - FULL

if excess > 0:
    pay = (FULL * rate) + (excess * ot_rate)
else:
    pay = hrs * rate

print(pay)
