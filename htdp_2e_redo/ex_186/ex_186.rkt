;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_186) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 186. Take a second look at intermezzo 1, the intermezzo that
presents BSL and its ways of formulating tests. One of the latter is check-
satisfied, which determines whether an expression satisfies a certain
property. Use sorted>? from exercise 145 to reformulate the tests for
sort> with check-satisfied.

Now consider this function definition:

; List-of-numbers -> List-of-numbers
; produces a sorted version of l
(define (sort>/bad l)
(list 9 8 7 6 5 4 3 2 1 0))

Can you formulate a test case that shows that sort>/bad is not a sorting
function? Can you use check-satisfied to formulate this test case?
|#
