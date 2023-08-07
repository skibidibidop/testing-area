;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_243) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 243. Assume the definitions area in DrRacket contains

(define (f x) x)

Identify the values among the following expressions:

1. (cons f '())
2. (f f)
3. (cons f (cons 10 (cons (f 10) '())))

Explain why they are (not) values.
|#

(define (f x) x)

; (cons f '())
; f here is not defined since it is invoked as a variable and not
; as a function

; (f f)
; The function (f) is being given an undefined variable f

; (cons f (cons 10 (cons (f 10) '())))
; Results to (list f 10 10), with the first f being an undefined
; variable