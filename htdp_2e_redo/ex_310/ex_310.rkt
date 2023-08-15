#|
Author: Mark Beltran
Date: August 15, 2023

Exercise 310. Develop count-persons. The function consumes a family tree and
counts the child structures in the tree.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct no-parent [])

(define NP (make-no-parent))

(define-struct child [father mother name date eyes])
; An FT (short for family tree) is one of:
; -- NP
; -- (make-child FT FT String N String)

; FUNCTIONS ////////////////////////////////////////////////////////////////////
