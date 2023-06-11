#|
Author: Mark Beltran
Date: June 10, 2023

See (multiply) function purpose.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; a nat_num is one of:
; 0
; (add1 nat_num)
; Interp.: a natural number
; (define nat1 0)
; (define nat2 10000)

; FUNCTION DEFINITION //////////////////////////////////////////////////////////

; nat_num Number -> Number
; Multiplies nat_num with Number without using the primitive operator *.
(check-expect (multiply 3 4.5) 13.5)
(check-expect (multiply 0 12) 0)
(check-expect (multiply 5 -23) -115)

(define (multiply nat)
  (cond[zero? 0]
       [else (
