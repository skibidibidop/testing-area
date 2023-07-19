#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 41.

Design a program that moves a car from left
to right on the world canvas, three pixels per clock tick.
|#

(require 2htdp/universe)
(require 2htdp/image)

(define WHEEL_RADIUS 5) ; Point of control
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

(define MOVE_SPEED 3) ; Pixels/tick

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A WorldState is a Number
; Interp.: the car's x-coordinate

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; WorldState -> Image
; Renders image of car on the given x-coordinate
(check-expect (render 15)
              (place-images
               (list WHEEL WHEEL BODY)
               (list (make-posn (+ (- XCENTER WHEEL_DIST) 15) WHEEL_YPOS)
                     (make-posn (+ (+ XCENTER WHEEL_DIST) 15) WHEEL_YPOS)
                     (make-posn (+ XCENTER 15) BODY_YPOS))
               BG))

(define (render ws)
  (place-images
   (list WHEEL WHEEL BODY)
   (list (make-posn (+ (- XCENTER WHEEL_DIST) ws) WHEEL_YPOS)
         (make-posn (+ (+ XCENTER WHEEL_DIST) ws) WHEEL_YPOS)
         (make-posn (+ XCENTER ws) BODY_YPOS))
   BG))

; WorldState -> WorldState
; Updates WorldState per tick
(check-expect (time_step 25) 28)

(define (time_step ws)
  (+ ws MOVE_SPEED))

; WorldState -> WorldState
(define (main state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]))

(main -100)
