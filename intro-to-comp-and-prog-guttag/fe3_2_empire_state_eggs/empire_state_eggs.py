# -*- coding: utf-8 -*-
"""
Author: Mark Beltran
Date: May 11, 2023

From which floor can we drop an egg without
breaking it?
"""

import sys

egg_type = input("From which animal is this egg from? ")
prompt = "From which floor can we drop the egg without "
prompt += "breaking it? Pick a floor from 1 to 102. "
safe_floor = int(input(prompt))

if safe_floor < 1 or safe_floor > 102:
    print("Invalid floor.")
    sys.exit()

print("The Egg Dropper will now find a safe floor to drop",
      "the egg from.")

low = 1
high = 102
egg_no = 0

# The Egg Dropper's guess is correct if it is >= safe_floor
while True:
    guess = (high // 2)
    egg_no += 1

    print(f"Guess #{egg_no}")
    if guess <= safe_floor:
        break
    else:
        high = guess

print(f"It's safe to drop the {egg_type} egg from floor #{guess}.")

