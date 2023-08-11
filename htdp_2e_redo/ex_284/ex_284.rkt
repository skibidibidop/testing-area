#|
Author: Mark Beltran
Date: August 12, 2023

Exercise 284. Step through the evaluation of these expressions:
|#

; ((lambda (x) x) (lambda (x) x))

; ((lambda (x) (x x)) (lambda (x) x))

; infinite loop
((lambda (x) (x x)) (lambda (x) (x x)))
