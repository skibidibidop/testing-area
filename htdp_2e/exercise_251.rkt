;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_251) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 13, 2023

Exercise 251
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A [List_of ITEM] is one of:
; -'()
; -(cons ITEM [List_of ITEM]

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; [List_of Number] -> Number
; Computes the sum of the numbers on l
(define (sum l)
  (cond
    [(empty? l) 0]
    [else
     (+ (first l)
        (sum (rest l)))]))

; [List_of Number] -> Number
; Computes the product of the numbers on l
(define (product l)
  (cond
    [(empty? l) 1]
    [else
     (* (first l)
        (product (rest l)))]))