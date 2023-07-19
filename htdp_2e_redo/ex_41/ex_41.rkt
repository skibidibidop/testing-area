#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 41.

Design a program that moves a car from left
to right on the world canvas, three pixels per clock tick.
|#

(require 2htdp/universe)
(require 2htdp/image)

(define WHEEL_RADIUS 5)
(define WHEEL_DIST (* WHEEL_RADIUS 3))

(define SWIDTH (* WHEEL_RADIUS 50))
(define SHEIGHT (* WHEEL_RADIUS 20))
(define XCENTER (/ SWIDTH 2))
(define YCENTER (/ SHEIGHT 2))

(define BODY (rectangle (/ SWIDTH 4) (/ SHEIGHT 2) "solid" "red"))
(define WHEEL (circle (* WHEEL_RADIUS 2) "solid" "black"))
(define BG (empty-scene SWIDTH SHEIGHT))

(define BODY_YPOS (- SHEIGHT (/ (image-height BODY) 1.8)))
(define WHEEL_YPOS (- SHEIGHT WHEEL_RADIUS))

(define CAR
  (place-images
   (list WHEEL
         WHEEL
         BODY)
   (list (make-posn (- XCENTER WHEEL_DIST) WHEEL_YPOS)
         (make-posn (+ XCENTER WHEEL_DIST) WHEEL_YPOS)
         (make-posn XCENTER BODY_YPOS))
   BG))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; FUNCTIONS ////////////////////////////////////////////////////////////////////
