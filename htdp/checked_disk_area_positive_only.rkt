#|
Author: Mark Beltran
Date: June 4, 2023

Compute the area of a disk. For input, allow positive numbers only.
|#

; Number -> Number
; Computes area of disk with radius v
(define (area_of_disk v)
  (* pi (* v v)))

; Any -> Number
; computes the area of a disk with radius v,
; if v is a number
(define (checked_area_of_disk v)
  (cond
    [(and (number? v) (positive? v)) (area_of_disk v)]
    [else (error "area_of_disk: positive number expected")]))
    
