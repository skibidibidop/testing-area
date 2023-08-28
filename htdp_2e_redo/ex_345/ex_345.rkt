#|
Author: Mark Beltran
Date: August 29, 2023

Exercise 345. Formulate a data definition for the representation of BSL
expressions based on the structure type definitions of add and mul. Let’s
use BSL-expr in analogy for S-expr for the new class of data.

Translate the following expressions into data:
1. (+ 10 -10)
2. (+ (* 20 3) 33)
3. (+ (* 3.14 (* 2 3)) (* 3.14 (* -1 -9)))

Interpret the following data as expressions:
1. (make-add -1 2)
2. (make-add (make-mul -2 -3) 33)
3. (make-mul (make-add 1 (make-mul 2 3)) 3.14)
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; FUNCTIONS ////////////////////////////////////////////////////////////////////
