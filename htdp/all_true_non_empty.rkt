#|
Author: Mark Beltran
Date: June 10, 2023

Returns #false if a non-empty list of Boolean values has a member that
is #false. Otherwise, return #true.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; a nempty_bool_list is one of:
; - (cons Boolean '())
; - (cons Boolean nonempty_list)
; Interp.: a non-empty list of Boolean values

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; nempty_bool_list -> Boolean
(define (all_true bool_nlist) #true)
