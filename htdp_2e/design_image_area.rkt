;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname design_image_area) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 18, 2023

Count the number of pixels in a given image.
|#

(require 2htdp/image)

; Image -> Number
; count pixels in given image
; given: (square 10 "solid" "red")
; expected: 100
(define (image_area img)
  (* (image-height img)
     (image-width img)))