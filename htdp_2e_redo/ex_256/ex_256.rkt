#|
Author: Mark Beltran
Date: August 19, 2023

Exercise 256. Explain the following abstract function:

; [X] [X -> Number] [NEList-of X] -> X
; finds the (first) item in lx that maximizes f
; if (argmax f (list x-1 ... x-n)) == x-i,
; then (>= (f x-i) (f x-1)), (>= (f x-i) (f x-2)), ...
(define (argmax f lx) ...)

Use it on concrete examples in ISL. Can you articulate an analogous pur-
pose statement for argmin?
|#

; The input for this function:
;  A function from X to Number
;  A non-empty list of X
; The output of this function:
;  X

; August 8, 2023
; I don't get this at all, where did i come from?? What does "maximizes f"
; mean?! I'll return to this later.

; August 19, 2023
; [X] [X -> Number] [NEList-of X] -> X
; Applies f to lx and returns the first result with the biggest value
(check-expect (argmax add1 (list 1 2 3)) 4)
(check-expect (argmax sub1 (list 3 4 5)) 4)

(define (argmax f lx) ...)

; Applies f to lx and returns the first result with the lowest value
(check-expect (argmax add1 (list 1 2 3)) 2)
(check-expect (argmax sub1 (list 1 2 3)) 0)

(define (argmin f lx) ...)
