;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_242) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 7, 2023

Exercise 242. Here is one more parametric data definition:

; A [Maybe X] is one of:
; -- #false
; -- X

Interpret these data definitions: [Maybe String], [Maybe [List-of String]],
and [List-of [Maybe String]].

Exercise continued from line 29
|#

; [Maybe String] is one of:
; #false
; String

; [Maybe [List-of String]] is one of:
; #false
; [List-of String]

; [List-of [Maybe String]] is one of:
; '()
; (cons [Maybe String] [List-of [Maybe String]])

; What does the following function signature mean:

; String [List-of String] -> [Maybe [List-of String]]

; The function consumes a String and a [List-of String] and
; returns either #false or [List-of String]

; returns the remainder of los starting with s
; #false otherwise
(check-expect (occurs "a" (list "b" "a" "d" "e"))
              (list "d" "e"))
(check-expect (occurs "a" (list "b" "c" "d")) #f)

(define (occurs s los)
  los)

; Work through the remaining steps of the design recipe.

