#|
Author: Mark Beltran
Date: June 10, 2023

See (one_true) function purpose.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; a nempty_bool_list is one of:
; - (cons Boolean '())
; - (cons Boolean nempty_bool_list)
; Interp.: a non-empty list of Boolean values
; (define nblist1 (cons #true '()))
; (define nblist2 (cons #false (cons #true '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; nempty_bool_list -> Boolean
; Returns #true if at least one member of the non-empty list is #true.
(check-expect (one_true (cons #true '())) #true)
(check-expect (one_true (cons #false '())) #false)
(check-expect (one_true (cons #false (cons #true (cons #false '())))) #true)

(define (one_true bool_nlist)
  (cond[(empty? (rest bool_nlist)) (first bool_nlist)]
       [else (or (first bool_nlist)
                  (one_true (rest bool_nlist)))]))
