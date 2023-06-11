#|
Author: Mark Beltran
Date: June 10, 2023

See (col) and (row) function puprose statements.
|#

(require 2htdp/image)

(define PIC (rectangle 5 3 "outline" "black"))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; a nat_num is one of:
; 0
; (add1 nat_num)
; Interp. a natural number
; (define nat1 0)
; (define nat2 300)

; FUNCTION DEFINITION //////////////////////////////////////////////////////////

; nat_num Image -> Image
; Produces a column of nat_num number of Image
(check-expect (col 0 PIC) empty-image)
(check-expect (col 1 PIC)
             (beside PIC empty-image))

(define (col nat img)
  (cond[(zero? nat) empty-image]
       [else
        (beside PIC
                (col (sub1 nat) PIC))]))
