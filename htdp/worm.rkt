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

(define MOVSPD (* SCALER 2))
(define GO_UP (* MOVSPD -1))
(define GO_DOWN MOVSPD)
(define GO_RIGHT MOVSPD)
(define GO_LEFT (* MOVSPD -1))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct worm_seg [loc hmove vmove])
; (make-worm_seg Posn Number Number)
; Interp.: (make-worm_seg l h v), represents a segment of a worm, with its
; coordinates (l), horizontal velocity (h), and vertical velocity (v)
(make-worm_seg (make-posn 30 40) 4 0)

; A Direction is one of:
; - "up"
; - "down"
; - "left"
; - "right"
; Interp.: a key event indicating the next movement direction

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Worm_seg -> Image
; Draws a WORM_SEGMENT on BG based on the coordinates in Worm_seg
(check-expect (render (make-worm_seg (make-posn XCENTER YCENTER) GO_RIGHT 0))
              (place-image WORM_SEGMENT XCENTER YCENTER BG))

(define (render wseg)
  (place-image WORM_SEGMENT
               (posn-x (worm_seg-loc wseg))
               (posn-y (worm_seg-loc wseg))
               BG))

; Worm_seg -> Worm_seg
; Moves the WORM_SEGMENT per tick
(check-expect (time_step (make-worm_seg (make-posn 50 50) GO_RIGHT 0))
              (make-worm_seg (make-posn (+ 50 GO_RIGHT) 50) GO_RIGHT 0))

(define (time_step wseg)
  (make-worm_seg
   (make-posn (+ (posn-x (worm_seg-loc wseg))
                 (worm_seg-hmove wseg))
              (+ (posn-y (worm_seg-loc wseg))
                 (worm_seg-vmove wseg)))
   (worm_seg-hmove wseg)
   (worm_seg-vmove wseg)))

; Worm_seg Direction -> Worm_seg
; Changes the WORM_SEGMENT's movement direction
(check-expect (change_direction
               (make-worm_seg (make-posn 50 50) GO_RIGHT 0) "right")
              (make-worm_seg (make-posn 50 50) GO_RIGHT 0))
(check-expect (change_direction
               (make-worm_seg (make-posn 50 50) GO_RIGHT 0) "left")
              (make-worm_seg (make-posn 50 50) GO_LEFT 0))
(check-expect (change_direction
               (make-worm_seg (make-posn 50 50) GO_RIGHT 0) "up")
              (make-worm_seg (make-posn 50 50) 0 GO_UP))
(check-expect (change_direction
               (make-worm_seg (make-posn 50 50) GO_RIGHT 0) "down")
              (make-worm_seg (make-posn 50 50) 0 GO_DOWN))

(define (change_direction wseg key_event) wseg)

#|
(define worm_state (make-posn XCENTER YCENTER) 0 GO_RIGHT)

(define (main worm)
  (big-bang worm
    [to-draw render]
    [on-tick time_step]
    [on-key change_direction]))

(main worm_state)
|#