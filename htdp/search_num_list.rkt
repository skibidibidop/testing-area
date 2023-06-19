#|
Author: Mark Beltran
Date: June 19, 2023

Determines if a number occurs in a sorted list.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; a sorted_numlist is one of:
; - '()
; - (cons Number num_list)
; Interp.: a list of number sorted in ascending order
; (define nl1 '())
; (define nl2 (list 1 2 3 4))
; (define nl3 (list -4 -3 -2 -1 0))

; FUNCTIONS ////////////////////////////////////////////////////////////////////
