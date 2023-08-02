#|
Author: Mark Beltran
Date: August 2, 2023

Exercise 149. Does copier function properly when you apply it to a
natural number and a Boolean or an image? Or do you have to design
another function? Read part III for an answer.

An alternative definition of copier might use else:

(define (copier.v2 n s)
  (cond
    [(zero? n) '()]
    [else (cons s (copier.v2 (sub1 n) s))]))

How do copier and copier.v2 behave when you apply them to 0.1
and "x"? Explain. Use DrRacket’s stepper to confirm your explanation.
|#


