;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_251) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 251. Design fold1, which is the abstraction of the two func-
tions in figure 93.
|#

; Functions from figure 93:

; [List-of Number] -> Number
; computes the sum of
; the numbers on l
(define (sum l)
  (cond
    [(empty? l) 0]
    [else
     (+ (first l)
        (sum (rest l)))]))

; [List-of Number] -> Number
; computes the product of
; the numbers on l
(define (product l)
  (cond
    [(empty? l) 1]
    [else
     (* (first l)
        (product (rest l)))]))

; (Number -> Number) [List-of Number] Number -> Number 
; Computes the result of applying (op) to all members of (l),
; with the base case (base)
(check-expect (fold1 + (list 0 1 2) 0) 3)
(check-expect (fold1 + '() 0) 0)
(check-expect (fold1 - (list 3 5 2) 0) 0)

(define (fold1 op l base)
  (cond
    [(empty? l) base]
    [else
     (op (first l)
         (fold1 op (rest l) base))]))