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

; N String -> List-of-strings
; creates a list of n copies of s
(check-expect (copier 0 "hello") '())
(check-expect (copier 2 "hello")
              (cons "hello" (cons "hello" '())))

(define (copier n s)
  (cond
    [(zero? n) '()]
    [(positive? n) (cons s (copier (sub1 n) s))]))

; copier does not function properly if it isn't given an N and a String.
; A new function has to be designed or copier has to be redesigned to
; handle cases such as those.

; Alternative definition provided:
(define (copier.v2 n s)
  (cond
    [(zero? n) '()]
    [else (cons s (copier.v2 (sub1 n) s))]))

; 0.1 causes an infinite loop
