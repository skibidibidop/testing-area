;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex_17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 17.
|#

(require 2htdp/image)

(define SCALER 10)

(define TALL_IMG (rectangle SCALER (* SCALER 3) "solid" "red"))
(define WIDE_IMG (rectangle (* SCALER 3) SCALER "solid" "red"))
(define SQR_IMG (square SCALER "solid" "red"))

; Image -> String
; Checks if image is tall, wide, or square
(check-expect (classify TALL_IMG) "Tall!")
(check-expect (classify WIDE_IMG) "Wide!")
(check-expect (classify SQR_IMG) "Square!")

(define (classify img)
  (cond
    [(= (image-width img) (image-height img))
     "Square!"]
    [(> (image-width img) (image-height img))
     "Wide!"]
    [else "Tall!"]))