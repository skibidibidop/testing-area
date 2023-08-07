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

(define MOD 10)
(define CONS_1 1.2)
(define CONS_2 3)
(define CONS_3 -5.775)

(define (add10 x)
  (+ x MOD))

(define (sub10 x)
  (- x MOD))

(define (mult10 x)
  (* x MOD))

; (Number -> Number) (Number -> Number) -> Boolean
; Determines if the 2 given functions return the same results given 1.2,
; 3, and -5.775.
(check-expect (function=at-1.2-3-and-5.775?
               add10 sub10) #false)
(check-expect (function=at-1.2-3-and-5.775?
               sub10 mult10) #false)
(check-expect (function=at-1.2-3-and-5.775?
               add10 mult10) #false)

(define (function=at-1.2-3-and-5.775? fn_a fn_b)
  (and (= (fn_a CONS_1) (fn_b CONS_1))
       (= (fn_a CONS_2) (fn_b CONS_2))
       (= (fn_a CONS_3) (fn_b CONS_3))))

; (Number -> Number) (Number -> Number) Number -> Boolean
; Determines if functions fn_x and fn_y are equal given a Number in
(define (function=? fn_x fn_y in) #false)
  