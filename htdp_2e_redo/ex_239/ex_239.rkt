;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_239) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 7, 2023

Exercise 239. A list of two items is another frequently used form of data
in ISL programming. Here is a data definition with two parameters:

; A [List X Y] is a structure:
; (cons X (cons Y '()))

Instantiate this definition to describe the following classes of data:

• pairs of Numbers,
• pairs of Numbers and 1Strings, and
• pairs of Strings and Booleans.

Also make one concrete example for each of these three data definitions.
|#

; pairs of Numbers
; A [List Number Number] is a structure:
; (cons Number (cons Number '()))
(define num_pair
  (cons 1 (cons 2 '())))

; pairs of Numbers and 1Strings
; A [List Number 1String] is a structure:
; (cons Number (cons 1String '()))
(define num_1str
  (cons 3 (cons "a" '())))

; pairs of Strings and Booleans
; A [List String Boolean] is a structure:
; (cons String (cons Boolean '()))
(define str_bool
  (cons "hey" (cons #false '())))