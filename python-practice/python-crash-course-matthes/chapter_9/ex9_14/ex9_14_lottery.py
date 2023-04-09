# Make list/tuple w/ series of 10 numbers
#   and 5 letters
# Randomly select 4 numbers or letters
# Print "Winning combo: <4 selected chars>

import random

pool = [0, 1, 2, 3, 4, 5, 6, 7,
        8, 9, "a", "b", "c",
        "d", "e"]
draw = []

counter = 0
while True:
    draw.append(random.choice(pool))

    if counter == 3:
        break

    counter += 1

print(f"Winning combo: {draw}")

