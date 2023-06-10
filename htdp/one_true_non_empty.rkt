#|
Author: Mark Beltran
Date: June 10, 2023

Returns #true if at least one member of the non-empty list is #true.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; a nempty_bool_list is one of:
; - (cons Boolean '())
; - (cons Boolean nempty_bool_list)
; Interp.: a non-empty list of Boolean values
; (define nblist1 (cons #true '()))
; (define nblist2 (cons #false (cons #true '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

;
(define (one_true bool_nlist) #true)
