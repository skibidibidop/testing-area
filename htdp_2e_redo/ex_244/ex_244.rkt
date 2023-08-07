;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_244) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 244. Argue why the following sentences are now legal:

1. (define (f x) (x 10))
2. (define (f x) (x f))
3. (define (f x y) (x 'a y 'b))

Explain your reasoning.
|#

; All (f)s are defined are functions

(define (f x) (x 10))
; x can be a primitive operator or a new function

(define (f x) (x f))
; The f on the left is the function's name
; while the f on the right is a variable. Legal
; since this is saying that x should be applied
; to whatever f (on the right) contains

(define (f x y) (x 'a y 'b))
; Legal because x can be a function/primitive operation
; and y can be any value that x can be applied to