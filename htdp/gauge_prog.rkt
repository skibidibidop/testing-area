;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname gauge_prog) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 19, 2023

Happiness gauge for cat
|#

(require 2htdp/image)
(require 2htdp/universe)

; MEASUREMENTS
(define scale 1)
(define SCENE_WIDTH (* scale 100))
(define SCENE_HEIGHT (* scale 10))

; IMAGES
(define gauge
  (rectangle SCENE_WIDTH SCENE_HEIGHT
             "solid" "red"))

; FUNCTION DEFINITIONS /////////////////////
; A WorldState is a Number
; Interpretation: no. of pixels between
; the rectangle's right side and the right
; border

; WorldState -> Image
