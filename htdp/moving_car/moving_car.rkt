;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname moving_car) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 18, 2023

Animation of a moving car. Stops when out of scene.
|#

(require 2htdp/image)
(require 2htdp/universe)

; Change the wheel size to change the scale
(define WHEEL_RADIUS 20)

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
(define CAR
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
     (/ (image-height CAR) 2)))

; The background
(define BACKGROUND
  (empty-scene SCENE_WIDTH SCENE_HEIGHT))

; Function definitions

; WorldState -> Image
; places CAR in BACKGROUND according to
; the given world state
(check-expect (render 60)
              (place-image CAR 60 Y_CAR BACKGROUND))
(check-expect (render 200)
              (place-image CAR 200 Y_CAR BACKGROUND))
(define (render x_pos)
  (place-image CAR x_pos Y_CAR BACKGROUND))


