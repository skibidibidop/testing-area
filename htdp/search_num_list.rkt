#|
Author: Mark Beltran
Date: June 19, 2023

Determines if a number occurs in a sorted list.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; a Sorted_numlist is one of:
; - '()
; - (cons Number sorted_numlist)
; Interp.: a list of number sorted in ascending order
; (define nl1 '())
; (define nl2 (list 1 2 3 4))
; (define nl3 (list -4 -3 -2 -1 0))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Number Sorted_numlist -> Boolean
; Determines if a number occurs in a sorted list.
(check-expect (in_list? 0 '()) #false)
(check-expect (in_list? 0 (list 0 1 2 3)) #true)
(check-expect (in_list? 0 (list 1 2 3)) #false)

(define (in_list? n snl) #false)
