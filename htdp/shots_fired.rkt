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
; - (cons shot shot_list)
; Interp.: collection of shots fired

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; shotworld -> Image
; Adds image of a shot for each y on state at (MID, y} to BG
(define (render state) BG)

; shotworld -> shotworld
; Moves each shot on state by 1 pixel / tick.
(define (time_step state) state)

; shotworld KeyEvent -> shotworld
; adds a shot to the world every time the space bar is pressed.
(define (shoot state ke) state)