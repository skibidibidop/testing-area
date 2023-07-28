#|
Author: Mark Beltran
Date: July 28, 2023

Exercise 111. Take a look at these definitions:

(define-struct vec [x y])
; A vec is
; (make-vec PositiveNumber PositiveNumber)
; interpretation represents a velocity vector

Develop the function checked-make-vec, which is to be understood as a
checked version of the primitive operation make-vec. It ensures that the
arguments to make-vec are positive numbers. In other words, checkedmake-vec
enforces our informal data definition.
|#

(define-struct vec [x y])
; A vec is
; (make-vec PositiveNumber PositiveNumber)
; interpretation represents a velocity vector

; PositiveNumber PositiveNumber -> Vec
; Makes a Vec if a and b are PositiveNumbers. Returns an error otherwise
(define (checked-make-vec a b)
  (cond
    [(and (positive? a) (positive? b))
     (make-vec a b)]
    [else (error "Please provide positive numbers only.")]))
