# Write class Die
#   attribute sides
#       default value = 6
#   method roll_die()
#       print number between 1 and the number
#       of sides the die has
# Make 6-sided die, roll 10x
# Make 10-sided die, roll 10x
# Make 20-sided die, roll 10x

import random

class Die:
    """Return random number between 1 and
    max number of sides the die has
    """
    def __init__(self, sides=6):
        """Take number of sides of die"""
        self.sides = sides

    def random_num(self):
        """Generate random number"""
        return random.randint(1, self.sides)

die6 = Die()
die10 = Die(10)
die20 = Die(20)

counter = 1
while True:
    print(f"d6 roll #{counter}: {die6.random_num()}")
    print(f"d10 roll #{counter}: {die10.random_num()}")
    print(f"d20 roll #{counter}: {die20.random_num()}")
    counter += 1

    if counter == 11:
        break

