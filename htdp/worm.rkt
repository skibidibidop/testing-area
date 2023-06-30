;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname worm) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 29, 2023

Snake game, basically.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)
(define SWIDTH (* SCALER 50))
(define SHEIGHT (* SCALER 50))
(define XCENTER (/ SWIDTH 2))
(define YCENTER (/ SHEIGHT 2))

(define WORM_SEGMENT (circle SCALER "solid" "red"))
(define BG (empty-scene SWIDTH SHEIGHT))

(define MOVSPD SCALER)
(define GO_UP (* MOVSPD -1))
(define GO_DOWN MOVSPD)
(define GO_RIGHT MOVSPD)
(define GO_LEFT (* MOVSPD -1))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct worm_seg [loc hmove vmove])
; (make-worm_seg Posn Number Number)
; Interp.: (make-worm_seg l h v), represents a segment of a worm, with its
; coordinates (l), horizontal velocity (h), and vertical velocity (v)
(make-worm_seg [(make-posn 30 40) 4 0])

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; 

#|
(define worm_state [(make-posn XCENTER YCENTER) 0 GO_RIGHT])

(define (main worm)
  (big-bang worm
    [to-draw render]
    [on-tick time_step]
    [on-key change_direction]))

(main worm_state)
|#