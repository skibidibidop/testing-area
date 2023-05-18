;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname car_pic) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 18, 2023

Image of a polygon car(?)
|#

(require 2htdp/image)
(require 2htdp/universe)

; Change the wheel size to change the scale
(define WHEEL_RADIUS 30)

(define WIDTH (* 20 WHEEL_RADIUS))
(define HEIGHT (* 10 WHEEL_RADIUS))

; Images
(define WHEEL
  (circle WHEEL_RADIUS "solid" "black"))

(define BETWEEN_WHEELS
  (rectangle (* 1.5 WHEEL_RADIUS)
             (* 0.5 WHEEL_RADIUS)
             "solid" "white"))

(define BOTH_WHEELS
  (beside WHEEL BETWEEN_WHEELS WHEEL))

(define BODY
  (rectangle
   (* 6 WHEEL_RADIUS)
   (* 2 WHEEL_RADIUS)
   "solid" "blue"))

(define DRIVER_SEAT
  (square (* 3 WHEEL_RADIUS)
          "solid" "blue"))

; Initial positions
(define X_DRIVER_SEAT
  (- (image-width BODY)
     (/ (image-width BODY) 2)))
(define Y_DRIVER_SEAT
  (- HEIGHT
     (+ (/ (image-height WHEEL) 2)
        (image-height BODY))))

(define X_BOTH_WHEELS
  (/ (image-width BODY) 2))
(define Y_BOTH_WHEELS
  (- HEIGHT
     (/ (image-height BOTH_WHEELS) 2)))

(define X_BODY (/ (image-width BODY) 2))
(define Y_BODY (- HEIGHT
                  (image-height WHEEL)))

; Main
(place-images
 (list BOTH_WHEELS
       DRIVER_SEAT
       BODY)
 (list (make-posn X_BOTH_WHEELS Y_BOTH_WHEELS)
       (make-posn X_DRIVER_SEAT Y_DRIVER_SEAT)
       (make-posn X_BODY Y_BODY))
 (empty-scene WIDTH HEIGHT))
