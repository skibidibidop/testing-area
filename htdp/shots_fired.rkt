;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname shots_fired) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 12, 2023

Sample problem (9.5 Lists and World) from HTDP2e

Simulates firing shots. Shots are added to the bottom of the scene each time the
space bar is pressed. Shots rise vertically at 1 px / tick.
|#

(require 2htdp/image)
(require 2htdp/universe)

; GRAPHICS /////////////////////////////////////////////////////////////////////

(define SCALER 10)

(define SWIDTH (* SCALER 10))
(define SHEIGHT (* SCALER 8))
(define SCN_XCENTER (/ SWIDTH 2))

(define BG (empty-scene SWIDTH SHEIGHT))
(define SHOT (triangle (* SCALER .3) "solid" "red"))

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; a num_list is one of:
; - '()
; - (cons Number num_list)
; Interp.: a list of numbers

; a shotworld is a num_list:
; Interp.: each number on the list represents a valid shot y-coordinate

; a shot_list is one of:
; - '()
; - (cons shotworld shot_list)
; Interp.: collection of shots fired

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; shotworld -> Image
; Adds image of a shot for each y on state at (SCN_XCENTER, y} to BG
(check-expect (render '()) BG)
(check-expect (render (cons 9 '()))
              (place-image SHOT SCN_XCENTER 9 BG))
(check-expect (render (cons 9 (cons 10 '())))
              (place-image SHOT SCN_XCENTER 9
                            (place-image SHOT SCN_XCENTER 10 BG)))

(define (render state)
  (cond[(empty? state) BG]
       [else
        (place-image SHOT SCN_XCENTER (first state)
                     (render (rest state)))]))

; shotworld -> shotworld
; Moves each shot on state by 1 pixel / tick.
(check-expect (time_step '()) '())
(check-expect (time_step (cons 9 '())) (cons 10 '()))
(check-expect (time_step (cons 11 (cons 13 '())))
              (cons 12 (cons 14 '())))

(define (time_step state)
  (cond[(empty? state) state]
       [else
        (cons (add1 (first state))
              (time_step (rest state)))]))

; shotworld KeyEvent -> shotworld
; adds a shot to the world every time the space bar is pressed.
(check-expect (shoot '() " ") (cons SHEIGHT '()))
(check-expect (shoot (cons 20 '()) " ") (cons SHEIGHT (cons 20 '())))
(check-expect (shoot '() "a") '())
(check-expect (shoot (cons 25 '()) "a") (cons 25 '()))

(define (shoot state ke)
  (cond[(string=? ke " ")
        (cons SHEIGHT state)]
       [else state]))

(define (main init)
  (big-bang init
       [to-draw render]
       [on-tick time_step]
       [on-key shoot]))
