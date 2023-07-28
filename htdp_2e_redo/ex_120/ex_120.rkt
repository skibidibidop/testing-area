#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 120. Discriminate the legal from the illegal sentences:

1. (x)
2. (+ 1 (not x))
3. (+ 1 2 3)

Explain why the sentences are legal or illegal. Determine whether the legal
ones belong to the category expr or def.
|#

; 1. Illegal, this variable shouldn't be enclosed in parentheses.
; 2. Illegal, can't use the operator + on a Boolean (the result of (not x))
; 3. Legal, all arguments are valid for the operator +
