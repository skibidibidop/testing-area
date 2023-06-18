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
; Produces a sorted version of provided num_list
(define (sort_desc nl)
  nl)
