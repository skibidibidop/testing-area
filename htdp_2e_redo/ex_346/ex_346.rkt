#|
Author: Mark Beltran
Date: August 29, 2023

Exercise 346. Formulate a data definition for the class of values to which
a representation of a BSL expression can evaluate.
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
