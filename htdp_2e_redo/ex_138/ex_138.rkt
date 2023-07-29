#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 138. Here is a data definition for representing sequences of
amounts of money:

; A List-of-amounts is one of:
; -- '()
; -- (cons PositiveNumber List-of-amounts)

Create some examples to make sure you understand the data definition.
Also add an arrow for the self-reference.

Design the sum function, which consumes a List-of-amounts and computes
the sum of the amounts. Use DrRacket’s stepper to see how (suml)
works for a short list l in List-of-amounts
|#

; An example of a List-of-amounts
(define amount_list1
  (cons 13 (cons 45.9 (cons 0.4 '()))))

; List-of-amounts -> Number
; Computes the sum of the amounts in List-of-amounts
(check-expect (sum '()) 0)
(check-expect (sum (cons 2 '())) 2)
(check-expect (sum (cons 3 (cons 2 (cons 5 '())))) 10)

(define (sum al)
  (cond
    [(empty? al) 0]
    [else
     (+ (first al)
        (sum (rest al)))]))
