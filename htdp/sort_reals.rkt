#|
Author: Mark Beltran
Date: June 18, 2023

Code-along: 11.3 sample problem (sort reals)
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A num_list is one of:
; - '()
; - (cons Number num_list)
; Interp.: A list of numbers
; (define nl1 '())
; (define nl2 (cons 1 '()))
; (define nl3 (cons 1 (cons 2 '())))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; num_list -> num_list
; Sorts nl in descending order
(check-expect (sort_desc '()) '())
(check-expect (sort_desc (list 3 2 1)) (list 3 2 1))
(check-expect (sort_desc (list 1 2 3)) (list 3 2 1))
(check-expect (sort_desc (list 12 20 -5)) (list 20 12 -5))

(define (sort_desc nl)
  nl)
