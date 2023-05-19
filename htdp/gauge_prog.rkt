;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname gauge_prog) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 19, 2023

Happiness gauge
|#

(require 2htdp/image)
(require 2htdp/universe)

(define scaler 2)
(define SCENE_WIDTH (* scaler 100))
(define SCENE_HEIGHT (* scaler 10))
(define X_CENTER (/ SCENE_WIDTH 2))
(define Y_CENTER (/ SCENE_HEIGHT 2))

(define gauge
  (rectangle SCENE_WIDTH SCENE_HEIGHT
             "solid" "red"))
(define bg
  (empty-scene SCENE_WIDTH SCENE_HEIGHT))

(define IMG_X_CENTER
  (/ (image-width gauge) 2))
(define IMG_Y_CENTER
  (/ (image-height gauge) 2))

(define x_coord X_CENTER)
(define lower_limit (- 0 X_CENTER))
(define upper_limit X_CENTER)

(define happy_up (/ SCENE_WIDTH 3))
(define happy_down (/ SCENE_WIDTH 5))

; FUNCTION DEFINITIONS /////////////////////
; A WorldState is a Number
; Interpretation: no. of pixels between
; the rectangle's right side and the right
; border

; WorldState -> Image
; Gives big-bang the image to be rendered
; based on the current WorldState
(define (give_img x_pos)
  (place-image gauge x_pos IMG_Y_CENTER bg))

; WorldState -> WorldState
; Gives big-bang the new WorldState for
; each tick
(define (give_x cw)
  (if (<= cw lower_limit)
      lower_limit
      (- cw 0.1)))

; WorldState String -> WorldState
; Gives new WorldState to big-bang for
; each keystroke
(define (change_mood cw ke)
  (cond[(key=? ke "up")
        (if (>= (+ cw happy_up)
                upper_limit)
            upper_limit
            (+ cw happy_up))]
       [(key=? ke "down") (- cw happy_down)]))

; MAIN ////////////////////////////////////
(big-bang x_coord
  [to-draw give_img]
  [on-tick give_x]
  [on-key change_mood])
  