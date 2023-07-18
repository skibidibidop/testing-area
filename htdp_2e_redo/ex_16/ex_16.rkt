;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex_16) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 16.
|#

(require 2htdp/image)

; Image -> Number
; Counts the pixels in a given image.
(define sqr_img (square 50 "solid" "red"))

(check-expect (image_area sqr_img) 2500)

(define (image_area img)
  (* (image-width img) (image-height img)))