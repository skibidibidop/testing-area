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
; Returns #false if nempty_bool_list isn't comprised purely of #true as members.
(check-expect (all_true (cons #true (cons #true (cons #true '())))) #true)
(check-expect (all_true (cons #true (cons #false (cons #true '())))) #false)

(define (all_true bool_nlist)
  (cond[(empty? (rest bool_nlist)) (first bool_nlist)]
       [else (and (first bool_nlist)
                  (all_true (rest bool_nlist)))]))
