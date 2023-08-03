#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 170. Here is one way to represent a phone number:

(define-struct phone [area switch four])
; A Phone is a structure:
; (make-phone Three Three Four)
; A Three is a Number between 100 and 999.
; A Four is a Number between 1000 and 9999.

Design the function replace. It consumes and produces a list of Phones.
It replaces all occurrence of area code 713 with 281.
|#

(define-struct phone [area switch four])
; A Phone is a structure:
; (make-phone Three Three Four)
; A Three is a Number between 100 and 999.
; A Four is a Number between 1000 and 9999.

