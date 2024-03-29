#|
Author: Mark Beltran
Date: August 2, 2023

Exercise 150. Design the function add-to-pi. It consumes a natural
number n and adds it to pi without using the primitive + operation. Here
is a start:

; N -> Number
; computes (+ n pi) without using +
(check-within (add-to-pi 3) (+ 3 pi) 0.001)

(define (add-to-pi n)
  pi)

Once you have a complete definition, generalize the function to add, which
adds a natural number n to some arbitrary number x without using +. Why
does the skeleton use check-within?
|#

; N -> Number
; computes (+ n pi) without using +
(check-within (add-to-pi 3) (+ 3 pi) 0.001)

(define (add-to-pi n)
  (cond
    [(= n 0) pi]
    [else
     (add1 (add-to-pi (- n 1)))]))

; N Number -> Number
; Adds Natrual number n to a Number x
(check-within (add 3 4) (+ 3 4) 0.001)

(define (add n x)
  (cond
    [(= n 0) x]
    [else
     [add1 (add (- n 1) x)]]))
