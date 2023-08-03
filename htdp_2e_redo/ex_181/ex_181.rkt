;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_181) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 181. Use list to construct the equivalent of these lists:

1. (cons "a" (cons "b" (cons "c" (cons "d" '()))))
2. (cons (cons 1 (cons 2 '())) '())
3. (cons "a" (cons (cons 1 '()) (cons #false '())))
4. (cons (cons "a" (cons 2 '())) (cons "hello" '()))

Also try your hand at this one:
(cons (cons 1 (cons 2 '()))
      (cons (cons 2 '())
            '()))

Start by determining how many items each list and each nested list con-
tains. Use check-expect to express your answers; this ensures that your
abbreviations are really the same as the long-hand.
|#

; 1
(list "a" "b" "c" "d")

; 2
(list
 (list 1 2))

; 3
(list
 "a"
 (list
  (list 1)
  (list #false)))

; 4
(list
 (list "a" 2)
 (list "hello"))

; 5
(list
 (list 1 2)
 (list
  (list 2)))