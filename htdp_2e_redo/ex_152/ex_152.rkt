;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_152) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 2, 2023

Exercise 152. Design two functions: col and row.

The function col consumes a natural number n and an image img. It
produces a column—a vertical arrangement—of n copies of img.

The function row consumes a natural number n and an image img. It
produces a row—a horizontal arrangement—of n copies of img.
|#

(require 2htdp/image)

(define SCALER 1)

(define CIRCLE_IMG (circle (* SCALER 10) "outline" "red"))
(define SQUARE_IMG (square (* SCALER 10) "solid" "black"))

; N Image -> Image
; Produces a column of n copies of img
(check-expect (col 0 CIRCLE_IMG) empty-image)
(check-expect (col 1 SQUARE_IMG)
              (above SQUARE_IMG empty-image))
(check-expect (col 3 CIRCLE_IMG)
              (above CIRCLE_IMG CIRCLE_IMG CIRCLE_IMG empty-image))

(define (col n img)
  (cond
    [(= n 0) empty-image]
    [else
     (above img (col (- n 1) img))]))

; N Image -> Image
; Produces a row of n copies of img
(define (row n img) empty-image)
