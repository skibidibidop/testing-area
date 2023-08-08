;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_246) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 246. Check step 1 of the last calculation

(extract < (cons 6 (cons 4 '())) 5)
==
(extract < (cons 4 '()) 5)

using DrRacket’s stepper.
|#

(define (extract R l t)
  (cond
    [(empty? l) '()]
    [else (cond
            [(R (first l) t)
             (cons (first l)
                   (extract R (rest l) t))]
            [else
             (extract R (rest l) t)])]))

(extract < (cons 6 (cons 4 '())) 5)

; The first step of the last calculation is to cons the first of the
; remaining list to rest of the remaining list.