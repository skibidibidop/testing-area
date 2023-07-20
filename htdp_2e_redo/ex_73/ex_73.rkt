#|
Author: Mark Beltran
Date: July 21, 2023

Exercise 73. Design the function posn-up-x, which consumes a Posn
p and a Number n. It produces a Posn like p with n in the
x field. A neat observation is that we can define x+ using posn-up-x:

(define (x+ p)
  (posn-up-x p (+ (posn-x p) 3)))

Note Functions such as posn-up-x are often called updaters or functional
setters. They are extremely useful when you write large programs.
|#

; Posn Number -> Posn
; Produces a Posn with n in its x field
(check-expect (posn_up_x (make-posn 0 1) 2)
              (make-posn 2 1))

(define (posn_up_x p n)
  (make-posn n (posn-y p)))
