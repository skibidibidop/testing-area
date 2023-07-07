;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname red_dot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 22, 2023

Move red dot across canvas.
Mouse click sets dot on the coordinates
of the cursor.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define scaler 30)
(define SCENE_WIDTH (* scaler 10))
(define SCENE_HEIGHT (* scaler 10))

(define BG (empty-scene SCENE_WIDTH
                        SCENE_HEIGHT))
(define DOT (circle (* scaler 0.3)
                    "solid" "red"))

; Movement speed of DOT, pixels/tick
(define MOVE_SPEED 3)

; A posn is a structure that represents
; the current world state.
;     (make-posn [Number Number])
; Interpretation: x-coordinate, y-coordinate

; posn -> posn
(define (main p0)
  (big-bang p0
    [on-tick x_move]
    [on-mouse reset_dot]
    [to-draw put_dot]))

; posn -> Image
; Renders DOT based on the current world state.
(check-expect (put_dot (make-posn 5 0)) (place-image DOT 5 0 BG))
(define (put_dot current_state)
  (place-image DOT
               (posn-x current_state)
               (posn-y current_state)
               BG))

; posn -> posn
; Increases the x-coordinate of current_state by
; MOVE_SPEED (pixels/tick)
(check-expect (x_move (make-posn 15 0)) (make-posn (+ 15 MOVE_SPEED) 0))
(define (x_move current_state)
  (make-posn (+ (posn-x current_state) MOVE_SPEED) (posn-y current_state)))

; posn Number Number MouseEvent -> posn
; Sets current_state to x, y coordinates of mouse cursor when clicked
(check-expect (reset_dot (make-posn 10 0) 39 2 "button-down")
              (make-posn 39 2))
(check-expect (reset_dot (make-posn 10 0) 12 30 "button-up")
              (make-posn 10 0))
(define (reset_dot current_state mouse_x mouse_y mouse_event)
  (cond[(mouse=? mouse_event "button-down") (make-posn mouse_x mouse_y)]
       [else current_state]))

(main (make-posn 10 50))
