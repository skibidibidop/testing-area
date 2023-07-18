;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex_8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 8.
|#

(require 2htdp/image)

(define SCALER 10)

(define TALL_IMG
  (rectangle SCALER (* SCALER 3) "solid" "brown"))
(define WIDE_IMG
  (rectangle (* SCALER 3) SCALER "solid" "brown"))
(define SQR_IMG
  (rectangle SCALER SCALER "solid" "brown"))

(define (t_or_w img)
  (cond
    [(= (image-width img) (image-height img))
     "Square!"]
    [(> (image-width img) (image-height img))
     "Wide!"]
    [else "Tall!"]))

(t_or_w TALL_IMG)
(t_or_w WIDE_IMG)
(t_or_w SQR_IMG)

