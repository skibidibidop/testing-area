#|
Author: Mark Beltran
Date: July 28, 2023

Exercise 110. A checked version of area-of-disk can also enforce
that the arguments to the function are positive numbers, not just arbitrary
numbers. Modify checked-area-of-disk in this way.
|#

(define MESSAGE "area-of-disk: positive number expected")

; DATA DEFINITION //////////////////////////////////////////////////////////////

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Number -> Number
; computes the area of a disk with radius r
(define (area-of-disk r)
  (* 3.14 (* r r)))

; Any -> Number
; computes the area of a disk with radius v,
; if v is a number
(check-error (checked-area-of-disk "hi")
             (error MESSAGE))

(define (checked-area-of-disk v)
  (cond
    [(positive? v) (area-of-disk v)]
    [else (error MESSAGE)]))
