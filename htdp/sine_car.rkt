;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sine_car) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 18, 2023

Animation of a car moving according to a sine wave.
Stops when out of scene.
|#

(require 2htdp/image)
(require 2htdp/universe)

; Change the wheel size to change the scale
(define WHEEL_RADIUS 40)

(define SCENE_WIDTH (* 20 WHEEL_RADIUS))
(define SCENE_HEIGHT (* 10 WHEEL_RADIUS))

; Image components
(define WHEEL
  (circle WHEEL_RADIUS "solid" "black"))

(define BETWEEN_WHEELS
  (rectangle (* 1.5 WHEEL_RADIUS)
             (* 0.5 WHEEL_RADIUS)
             0 "white"))

(define BOTH_WHEELS
  (beside WHEEL BETWEEN_WHEELS WHEEL))

(define BODY
  (rectangle
   (* 6 WHEEL_RADIUS)
   (* 2 WHEEL_RADIUS)
   "solid" "blue"))

(define DRIVER_SEAT
  (square (* 3 WHEEL_RADIUS) "solid" "blue"))

; Car image dimensions
(define CAR_WIDTH (image-width BODY))
(define CAR_HEIGHT (+ (image-height BODY)
                      (/ (image-height WHEEL) 2)
                      (/ (image-height DRIVER_SEAT) 2)))

; Initial component positions
(define X_DRIVER_SEAT
  (- (image-width BODY)
     (/ (image-width BODY) 2)))
(define Y_DRIVER_SEAT
  (- CAR_HEIGHT
     (+ (/ (image-height WHEEL) 2)
        (image-height BODY))))

(define X_BOTH_WHEELS (/ (image-width BODY) 2))
(define Y_BOTH_WHEELS
  (- CAR_HEIGHT
     (/ (image-height BOTH_WHEELS) 2)))

(define X_BODY (/ (image-width BODY) 2))
(define Y_BODY (- CAR_HEIGHT
                  (image-height WHEEL)))

; The car
(define a_car
  (place-images
   (list BOTH_WHEELS
         DRIVER_SEAT
         BODY)
   (list (make-posn X_BOTH_WHEELS Y_BOTH_WHEELS)
         (make-posn X_DRIVER_SEAT Y_DRIVER_SEAT)
         (make-posn X_BODY Y_BODY))
   (rectangle CAR_WIDTH CAR_HEIGHT
              0 "white")))

; Car's fixed y-coordinate
(define Y_CAR
  (- SCENE_HEIGHT
     (/ (image-height a_car) 2)))

; The tree
(define tree
  (underlay/xy (circle
                (* 2 WHEEL_RADIUS)
                "solid" "green")
               (* 1.5 WHEEL_RADIUS)
               (* 2 WHEEL_RADIUS)
               (rectangle
                (* 1 WHEEL_RADIUS)
                (* 4 WHEEL_RADIUS)
                "solid" "brown")))

; The background
(define BACKGROUND
  (place-image tree
               (/ SCENE_WIDTH 2)
               (- SCENE_HEIGHT
                  (/ (image-height tree) 2))
               (empty-scene SCENE_WIDTH SCENE_HEIGHT)))

; The car's starting x-coordinate
(define START 50)

; Stop when the car is fully outside of BACKGROUND
(define STOP
  (+ SCENE_WIDTH
     (/ (image-width a_car) 1.5)))

; FUNCTION DEFINITIONS

; WorldState -> Image
; places CAR in BACKGROUND according to
; the given world state
(check-expect (render 60)
              (place-image a_car 60 Y_CAR BACKGROUND))
(check-expect (render 200)
              (place-image a_car 200 Y_CAR BACKGROUND))
(define (render x_pos)
  (place-image a_car x_pos Y_CAR BACKGROUND))

; Number -> Number
; increment given number by 3
(check-expect (add3 1)
              4)
(define (add3 n)
  (+ n 3))

; Number -> Boolean
; #false when n >= STOP
(define (stop? n)
  (>= n STOP))

; MAIN
(big-bang START
  [to-draw render]
  [on-tick add3]
  [stop-when stop?])
