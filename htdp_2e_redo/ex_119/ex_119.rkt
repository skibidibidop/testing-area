#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 119. Consider the following sentences:

1. (define (f "x") x)
2. (define (f x y z) (x))

Explain why they are syntactically illegal.
|#

; (define (f "x") x) :
; Arguments shouldn't be enclosed in quotation marks
; in function definitions. They are detected as strings.

; (define (f x y z) (x)) :
; x in the right part of this function definition shouldn't
; be enclosed in parentheses
