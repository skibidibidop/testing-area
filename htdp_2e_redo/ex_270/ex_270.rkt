;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_270) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 270. Use build-list to define a function that

1. creates the list (list 0 ... (- n 1)) for any natural number n;
2. creates the list (list 1 ... n) for any natural number n;
3. creates the list (list 1 1/2 ... 1/n) for any natural number n;
4. creates the list of the first n even numbers; and
5. creates a diagonal square of 0s and 1s; see exercise 262.

Finally, define tabulate from exercise 250 using build-list.
|#

; 1. creates the list (list 0 ... (- n 1)) for any natural number n;

; Number -> [List-of Number]
; Generates a list from 0 to (- n 1)
(check-expect (list_to_1less 0) '())
(check-expect (list_to_1less 10)
              (list 0 1 2 3 4 5 6 7 8 9))

(define (list_to_1less n)
  (build-list n identity))

; 2. creates the list (list 1 ... n) for any natural number n;

; Number -> [List-of Number]
; Generates a list from 1 to n
(check-expect (one_to_n 0) '())
(check-expect (one_to_n 3) (list 1 2 3))

(define (one_to_n n)
  (build-list n add1))

; 3. creates the list (list 1 1/2 ... 1/n) for any natural number n;

; Number -> [List-of Number]
; Generates a list from 1 to 1/n (list 1 1/2 ... 1/n)
(check-expect (list_fraction 0) '())
(check-expect (list_fraction 5)
              (list 1 1/2 1/3 1/4 1/5))

(define (list_fraction n)
  (local
    [(define (inc_denominator d)
       (/ 1 (add1 d)))]
  (build-list n inc_denominator)))

; 4. creates the list of the first n even numbers;

; Number -> [List-of Number]
; Generates a list of the first n even numbers
(check-expect (evens 0) '())
(check-expect (evens 1) (list 0))
(check-expect (evens 2) (list 0 2))
(check-expect (evens 5) (list 0 2 4 6 8))

(define (evens n)
  (local
    [(define (mult2 a)
       (* a 2))]
    (build-list n mult2)))