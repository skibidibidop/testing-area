#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 44. Formulate the examples as BSL tests. Click RUN and watch
them fail.
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

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A WorldState is a Number.
; interpretation the number of pixels between the left
; border of the scene and the car

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; WorldState -> Image
; Renders image of car on the given x-coordinate
(check-expect (render 0)
              (place-image CAR 0 CAR_YPOS BG))

(define (render ws)
  (place-image CAR ws CAR_YPOS BG))

; WorldState -> WorldState
; Updates WorldState per tick
(check-expect (time_step 25) 28)

(define (time_step ws)
  (+ ws MOVE_SPEED))

; WorldState Number Number String -> WorldState
; places CAR at x-mouse
(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)

(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

; WorldState -> WorldState
(define (main state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]
    [on-mouse hyper]))

(main 0)
