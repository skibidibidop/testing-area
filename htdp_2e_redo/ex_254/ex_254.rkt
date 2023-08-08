;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_254) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 254. Formulate signatures for the following functions:

sort-n, which consumes a list of numbers and a function that con-
sumes two numbers (from the list) and produces a Boolean; sort-n
produces a sorted list of numbers.

sort-s, which consumes a list of strings and a function that con-
sumes two strings (from the list) and produces a Boolean; sort-s
produces a sorted list of strings.

Then abstract over the two signatures, following the above steps. Also
show that the generalized signature can be instantiated to describe the sig-
nature of a sort function for lists of IRs.
|#

; Signature for sort-n
; [List-of Number] (Number Number -> Boolean) -> [List-of Number]

; Signature for sort-s
; [List-of String] (String String -> Boolean) -> [List-of String]

; Abstraction for the 2 signatures above
; [List-of A] (A A -> Boolean) -> [List-of A]

(define-struct ir [name price])
; An IR is a structure:
; (make-ir String Number)

; Signature for a sort function for lists of IRs
; [List-of IR] (IR IR -> Boolean) -> [List-of IR]
