;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_245) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 245. Develop the function=at-1.2-3-and-5.775? func-
tion. Given two functions from numbers to numbers, the function deter-
mines whether the two produce the same results for 1.2, 3, and -5.775.

Mathematicians say that two functions are equal if they compute the
same result when given the same input—for all possible inputs.

Can we hope to define function=?, which determines whether two
functions from numbers to numbers are equal? If so, define the function. If
not, explain why and consider the implication that you have encountered
the first easily definable idea for which you cannot define a function.
|#

; (Number -> Number) (Number -> Number) -> Boolean
; Determines if the 2 given functions return the same results given 1.2,
; 3, and -5.775.
(define (function=at-1.2-3-and-5.775? fn_a fn_b) #false)