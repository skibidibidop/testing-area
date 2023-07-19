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

(define CAR_WIDTH (/ SWIDTH 4))
(define CAR_HEIGHT (/ SHEIGHT 2.2))

(define BODY (rectangle CAR_WIDTH (/ SHEIGHT 2) "solid" "red"))
(define WHEEL (circle (* WHEEL_RADIUS 2) "solid" "black"))
(define CAR_BG (empty-scene CAR_WIDTH CAR_HEIGHT))
(define CAR_XCENTER (/ CAR_WIDTH 2))
(define WHEEL_YPOS (- CAR_HEIGHT WHEEL_RADIUS))

(define CAR
  (place-images
   (list WHEEL WHEEL BODY)
   (list (make-posn (- CAR_XCENTER WHEEL_DIST) WHEEL_YPOS)
         (make-posn (+ CAR_XCENTER WHEEL_DIST) WHEEL_YPOS)
         (make-posn CAR_XCENTER (- CAR_HEIGHT
                                   (/ (image-height BODY) 1.8))))
   CAR_BG))

(define CAR_YPOS (- SHEIGHT
                    (/ (image-height CAR) 2)))

(define BG (empty-scene SWIDTH SHEIGHT))

(define MOVE_SPEED 3) ; Pixels/tick
(define TICK_RATE 1)

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An AnimationState is a Number.
; Interp.: the number of clock ticks since the animation started

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; AnimationState -> Image
; Renders image of car on the given x-coordinate
(check-expect (render 10)
              (place-image CAR 30 CAR_YPOS BG))

(define (render astate)
  (place-image CAR (* astate MOVE_SPEED) CAR_YPOS BG))

; AnimationState -> AnimationState
; Updates WorldState per tick
(check-expect (time_step 3) 4)

(define (time_step astate)
  (+ astate TICK_RATE))

; AnimationState -> AnimationState
(define (main state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]))

(main 0)
