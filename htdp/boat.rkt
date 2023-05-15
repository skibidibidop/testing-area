; Author: Mark Beltran
; Date: May 15, 2023

; A simple image of a boat.
; Modify SCALE to change the size.

(require 2htdp/image)

; Measurements
(define SCALE 35)

(define BASE_HEIGHT (* 5 SCALE))
(define BASE_WIDTH (* 10 SCALE))
(define POLE_HEIGHT (* 10 SCALE))
(define POLE_WIDTH (* 0.5 SCALE))
(define SAIL_HEIGHT (* 9 SCALE))
(define SAIL_WIDTH (* 7 SCALE))
(define HYPOTENUSE (* 7.071 SCALE))
(define TRIANGLE_WIDTH (* 5 SCALE))
(define TRIANGLE_HEIGHT (* 5 SCALE))

(define SCENE_WIDTH (+ BASE_WIDTH
                       (* TRIANGLE_WIDTH 2)))
(define SCENE_HEIGHT (* 16 SCALE))

(define BASE_Y_POS
  (- SCENE_HEIGHT
     (/ BASE_HEIGHT 2)))
(define BASE_X_POS (/ SCENE_WIDTH 2))
(define LEFT_X_POS (/ TRIANGLE_WIDTH 2))
(define RIGHT_X_POS
  (- SCENE_WIDTH
   (/ TRIANGLE_WIDTH 2)))
(define POLE_Y_POS
  (- SCENE_HEIGHT
     (+ (/ POLE_HEIGHT 2)
        BASE_HEIGHT)))
(define SAIL_X_POS
  (+ (+ BASE_X_POS
        (/ POLE_WIDTH 2))
     (/ SAIL_WIDTH 2)))

; Boat parts
(define LEFT
  (triangle/sss TRIANGLE_HEIGHT
                HYPOTENUSE
                TRIANGLE_WIDTH
                "solid" "brown"))
(define RIGHT
  (triangle/sss HYPOTENUSE
                TRIANGLE_HEIGHT
                TRIANGLE_WIDTH
                "solid" "brown"))
(define BASE
  (rectangle BASE_WIDTH
             BASE_HEIGHT
             "solid" "brown"))
(define POLE
  (rectangle POLE_WIDTH
             POLE_HEIGHT
             "solid" "black"))
(define SAIL
  (right-triangle SAIL_WIDTH
                  SAIL_HEIGHT
                  "solid" "orange"))

; Main flow
(place-images
 (list LEFT
       BASE
       RIGHT
       POLE
       SAIL)
 (list (make-posn LEFT_X_POS BASE_Y_POS)
       (make-posn BASE_X_POS BASE_Y_POS)
       (make-posn RIGHT_X_POS BASE_Y_POS)
       (make-posn BASE_X_POS POLE_Y_POS)
       (make-posn SAIL_X_POS POLE_Y_POS))
 (empty-scene SCENE_WIDTH SCENE_HEIGHT))
            