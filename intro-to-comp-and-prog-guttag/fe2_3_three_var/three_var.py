# Author: Mark Beltran
# Date: May 10, 2023

# Print largest odd no.
# If no odd no., print smallest even no.

import sys

x = 9
y = 5000
z = 35
biggest = x
smallest= x

if (x % 2 != 0) or (y % 2 != 0) or (z % 2 != 0):
    if y > biggest:
        biggest = y
  
    if z > biggest:
        biggest = z
    
    print(biggest)
    sys.exit()

if y < smallest:
    smallest = y
    
if z < smallest:
    smallest = z
    
print(smallest)
