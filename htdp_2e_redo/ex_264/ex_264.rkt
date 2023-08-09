;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_264) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 9, 2023

Exercise 264. Use DrRacket’s stepper to calculate out how it evaluates

(sup (list 2 1 3))

where sup is the function from figure 89 equipped with local.
|#

; Nelon -> Number
; determines the largest
; number on l
(define (sup l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (local
       [(define sup_rest (sup (rest l)))]
       (if (> (first l) sup_rest)
           (first l)
           sup_rest))]))

(sup (list 2 1 3))