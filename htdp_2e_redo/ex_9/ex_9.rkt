;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex_9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 9.
|#

(require 2htdp/image)

(define IN_STR "Hello there!")
(define IN_IMG (rectangle 50 50 "solid" "red"))
(define IN_NUM_POS 30)
(define IN_NUM_ZERO 0)
(define IN_NUM_NEG -5)
(define IN_TRUE #true)
(define IN_FALSE #false)

(check-expect (convert IN_STR) 12)
(check-expect (convert IN_IMG) 2500)
(check-expect (convert IN_NUM_POS) 29)
(check-expect (convert IN_NUM_ZERO) 0)
(check-expect (convert IN_NUM_NEG) -5)
(check-expect (convert IN_TRUE) 10)
(check-expect (convert IN_FALSE) 20)

(define (convert in)
  (cond
    [(string? in)
     (string-length in)]
    [(image? in)
     (* (image-width in) (image-height in))]
    [(number? in)
     (if (> in 0)
         (- in 1)
         in)]
    [else
     (if in 10 20)]))