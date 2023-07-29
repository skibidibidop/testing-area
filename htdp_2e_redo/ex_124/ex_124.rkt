#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 124. Evaluate the following program, step-by-step:

(define PRICE 5)
(define SALES-TAX (* 0.08 PRICE))
(define TOTAL (+ PRICE SALES-TAX))

Does the evaluation of the following program signal an error?

(define COLD-F 32)
(define COLD-C (fahrenheit->celsius COLD-F))
(define (fahrenheit->celsius f)
  (* 5/9 (- f 32)))

How about the next one?

(define LEFT -100)
(define RIGHT 100)
(define (f x) (+ (* 5 (expt x 2)) 10))
(define f@LEFT (f LEFT))
(define f@RIGHT (f RIGHT))

Check your computations with DrRacket’s stepper.
|#

#|

Evaluate the following program, step-by-step:
SALES-TAX is (* 0.08 5), or 0.4
TOTAL is (+ 5 0.4) or 5.4

Does the evaluation of the following program signal an error?
No, the result is 0.

How about the next one?
No, the result for both f@LEFT and f@RIGHT is 50010
|#
