;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_256) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 256. Explain the following abstract function:

; [X] [X -> Number] [NEList-of X] -> X
; finds the (first) item in lx that maximizes f
; if (argmax f (list x-1 ... x-n)) == x-i,
; then (>= (f x-i) (f x-1)), (>= (f x-i) (f x-2)), ...
(define (argmax f lx) ...)

Use it on concrete examples in ISL. Can you articulate an analogous pur-
pose statement for argmin?
|#

; The input for this function:
;  A function from X to Number
;  A non-empty list of X
; The output of this function:
;  X

; I don't get this at all, where did i come from?? What does "maximizes f"
; mean?! I'll return to this later.