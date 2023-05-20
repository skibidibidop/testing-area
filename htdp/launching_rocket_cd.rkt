;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname launching_rocket_cd) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 20, 2023

Solve along with sample problem for launching
rocket countdown.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCENE_HEIGHT 300)
(define SCENE_WIDTH 100)
(define YDELTA 3)

(define BG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))

(define CENTER
  (/ (image-height ROCKET) 2))

; An LRCD (short for launching rocket countdown)
; is one of:
; -- "resting"
; -- a Number between -3 and -1
; -- a Nonnegative Number
; Interpretation: a grounded rocket, in countdown mode,
; the distance (# of pixels) between the top of the
; canvas and the rocket
