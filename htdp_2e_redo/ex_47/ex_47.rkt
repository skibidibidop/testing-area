;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_47) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 47. Design a world program that maintains and displays a
“happiness gauge.” Let’s call it gauge-prog, and let’s agree that the pro-
gram consumes the maximum level of happiness. The gauge display starts
with the maximum score, and with each clock tick, happiness decreases by
-0.1; it never falls below 0, the minimum happiness score. Every time the
down arrow key is pressed, happiness increases by 1/5; every time the up
arrow is pressed, happiness jumps by 1/3.
To show the level of happiness, we use a scene with a solid, red rect-
angle with a black frame. For a happiness level of 0, the red bar should be
gone; for the maximum happiness level of 100, the bar should go all the
way across the scene.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)
(define SCN_WIDTH (* SCALER 50))
(define SCN_HEIGHT SCALER)
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define HAP_GAUGE (rectangle SCN_WIDTH SCN_HEIGHT "solid" "red"))
(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

(define HALF_WIDTH_GAUGE (/ (image-width HAP_GAUGE) 2))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Happiness is a Number
; Interp.: the number of pixels from the left border of the scene to the right
; edge of the happiness gauge

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Happiness -> Image
; Draws HAP_GAUGE on BG, with HAP_GAUGE's position based on hpy
(check-expect (render 0)
              (place-image HAP_GAUGE (- 0 HALF_WIDTH_GAUGE) SCN_YCENTER BG))

(define (render hpy)
  (place-image HAP_GAUGE (- hpy HALF_WIDTH_GAUGE) SCN_YCENTER BG))