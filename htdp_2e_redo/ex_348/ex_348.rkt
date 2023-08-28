#|
Author: Mark Beltran
Date: August 29, 2023

Exercise 348. Develop a data representation for Boolean BSL expressions
constructed from #true, #false, and, or, and not. Then design
eval-bool-expression, which consumes (representations of) Boolean BSL
expressions and computes their values. What kind of values do these Boolean
expressions yield?
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct add [left right])
(define-struct mul [left right])

; A BSL-expr is one of:
; Number
; Add
; Mul

; A Result is a Number
; Interp.: result of evaluating a BSL-expr

; FUNCTIONS ////////////////////////////////////////////////////////////////////
