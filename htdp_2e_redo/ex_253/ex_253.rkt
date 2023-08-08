;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_253) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 253. Each of these signatures describes a class of functions:

; [Number -> Boolean]
; [Boolean String -> Boolean]
; [Number Number Number -> Number]
; [Number -> [List-of Number]]
; [[List-of Number] -> Boolean]

Describe these collections with at least one example from ISL.
|#

; [Number -> Boolean]
(inexact? x)

; [Boolean String -> Boolean]
(equal? x y)

; [Number Number Number -> Number]
(string-append a b c)

; [Number -> [List-of Number]]
(list n)

; [[List-of Number] -> Boolean]
(member? ln)

