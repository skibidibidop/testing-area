#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 131. Provide a data definition for representing lists of Boolean
values. The class contains all arbitrarily long lists of Booleans.
|#

; A Boolean_list is one of:
; '()
; (cons Boolean Boolean_list)
(define bool_list1
  (cons #true (cons #false (cons #false (cons #true '())))))
