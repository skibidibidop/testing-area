#|
Author: Mark Beltran
Date: August 2, 2023

Exercise 151. Design the function multiply. It consumes a natural
number n and multiplies it with a number x without using *.

Use DrRacket’s stepper to evaluate (multiply 3 x) for any x you
like. How does multiply relate to what you know from grade school?
|#

; N Number -> Number
; Multiplies Natural number n to Number x
(check-within (multiply 2 3) (* 2 3) 0.001)

(define (multiply n x)
  (cond
    [(= n 1) x]
    [else
     (+ x (multiply (- n 1) x))]))
