#|
Author: Mark Beltran
Date: June 10, 2023

See (nat_num) function purpose.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; a nat_num is one of:
; - 0
; (add1 nat_num)
; Interp.: a natural/counting number
; (define (nat1 0))
; (define (nat2 5000))

; FUNCTION DEFINITION //////////////////////////////////////////////////////////

; nat_num -> Number
; Adds nat_num to pi without using the + primtitive operator.
(check-within (add_to_pi 3) (+ 3 pi) 0.001)

(define (add_to_pi nat)
  (cond[(zero? nat) pi]
       [else (add1 (add_to_pi (sub1  nat)))]))