#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 159. Turn the solution of exercise 153 into a world program. Its
main function, dubbed riot, consumes how many balloons the students
want to throw; its visualization shows one balloon dropping after another
at a rate of one per second. The function produces the list of Posns where
the balloons hit.

Hints
(1) Here is one possible data representation:

(define-struct pair [balloon# lob])
; A Pair is a structure (make-pair N List-of-posns)
; A List-of-posns is one of:
; -- '()
; -- (cons Posn List-of-posns)
; interpretation (make-pair n lob) means n balloons
; must yet be thrown and added to lob

(2) A big-bang expression is really just an expression. It is legitimate
to nest it within another expression.

(3) Recall that random creates random numbers.
|#

