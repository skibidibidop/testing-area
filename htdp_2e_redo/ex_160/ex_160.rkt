#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 160. Design the functions set+.L and set+.R, which create
a set by adding a number x to some given set s for the left-hand and right
hand data definition, respectively.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Son.L is one of:
; -- empty
; -- (cons Number Son.L)
;
; Son is used when it
; applies to Son.L and Son.R
(define es '())

; A Son.R is one of:
; -- empty
; -- (cons Number Son.R)
;
; Constraint If s is a Son.R,
; no number occurs twice in s

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Number Son.L -> Son.L
; Adds Number x to Son.L s
(check-expect (set+L 3 '()) (list 3))
(check-expect (set+L 3 (list 3)) (list 3 3))
(check-expect (set+L 1 (list 1 2)) (list 1 1 2))

(define (set+L x s)
  (cons x s))

; Number Son.R -> Son.R
; Adds Number x to Son.R s if x is not yet a member of s
(check-expect (set+R 1 '()) (list 1))
(check-expect (set+R 1 (list 2)) (list 1 2))
(check-expect (set+R 3 (list 2 3)) (list 2 3))

(define (set+R x s)
  (cond
    [(member? x s) s]
    [else
     (cons x s)]))
