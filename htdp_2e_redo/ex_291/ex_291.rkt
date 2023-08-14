;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex_291) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 14, 2023

Exercise 291. The fold functions are so powerful that you can define
almost any list-processing functions with them. Use fold to define map-
via-fold, which simulates map.
|#

; (X -> Y) [List-of X] -> [List-of Y]
; Define the function map using fold
(check-expect (map-via-fold add1 '()) '())
(check-expect (map-via-fold add1 (list 0 1)) (list 1 2))
(check-expect (map-via-fold (lambda (n) (* n 3)) (list 0 1 2))
              (list 0 3 6))

(define (map-via-fold f l)
  (foldr
   (lambda (a_member b)
     (if (empty? a_member)
         '()
         (cons (f a_member) b)))
   '()
   l))