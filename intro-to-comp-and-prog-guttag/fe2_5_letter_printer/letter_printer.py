# -*- coding: utf-8 -*-

# Author: Mark Beltran
# Date: May 10, 2023

# Print the letter X as many times as the user wants

num_x = int(input("How many times should I print 'X'? "))
counter = 0
to_print = ""

#concatenate X to to_print num_x times
while(counter < num_x):
    to_print += "X"
    counter += 1

print(to_print)

