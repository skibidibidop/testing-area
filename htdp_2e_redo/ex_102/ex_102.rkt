;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_102) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 25, 2023

Exercise 102. Design all other functions that are needed to complete the
game for this second data definition.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 1) ; Single point of control

(define SCN_WIDTH   (* SCALER 200))
(define SCN_HEIGHT  (* SCALER 400))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define BG          (empty-scene SCN_WIDTH SCN_HEIGHT))

(define TANK_WIDTH  (* SCALER 50))
(define TANK_HEIGHT (* SCALER 10))
(define TANK        (rectangle TANK_WIDTH TANK_HEIGHT
                               "solid" "light steel blue"))
(define TANK_YPOS   (- SCN_HEIGHT (/ TANK_HEIGHT 2)))

(define UFO_RAD     (* SCALER 30))
(define UFO        (circle UFO_RAD "solid" "dark purple"))
(define UFO_XPOS    SCN_XCENTER)
(define UFO_LANDING_YPOS (- SCN_HEIGHT UFO_RAD))

(define MISSILE_SIDE_SIZE (* SCALER 10))
(define MISSILE (triangle MISSILE_SIDE_SIZE "solid" "red"))
(define MISSILE_START_YPOS (- SCN_HEIGHT
                              (+ TANK_HEIGHT
                                 (/ MISSILE_SIDE_SIZE 2))))

(define TANK_MOVSPD 3)
(define TANK_GO_RIGHT TANK_MOVSPD)
(define TANK_GO_LEFT (* TANK_MOVSPD -1))
(define UFO_MOVSPD  1)
(define MSL_MOVSPD  -3)
(define UFO_SPAZZ_LIM 10)

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct sigs [ufo tank missile])
; A SIGS.v2 (short for SIGS version 2) is a structure:
; (make-sigs UFO Tank MissileOrNot)
; Interp.: represents the complete state of a space invader game

; A UFO is a Posn
; Interp.: represents the x and y coordinates of the UFO

(define-struct tank [loc vel])
; (make-tank Number Number)
; Interp.: (make-tank x v), contains the tank's x-coordinate and velocity

; A MissileOrNot is one of:
; -- #false
; -- Posn
; Interp.: #false means the missile is in the tank;
; Posn says the missile is at that location

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; MissileOrNot Image -> Image
; adds an image of missile m to scene s
(define UFO_AND_TANK
  (place-images (list UFO TANK)
                (list (make-posn 30 40)
                      (make-posn SCN_XCENTER TANK_YPOS))
                BG))

(check-expect (missile-render.v2 #false UFO_AND_TANK) UFO_AND_TANK)
(check-expect (missile-render.v2 (make-posn SCN_XCENTER 10) UFO_AND_TANK)
              (place-image MISSILE SCN_XCENTER 10 UFO_AND_TANK))

(define (missile-render.v2 m s)
  (cond
    [(boolean? m) s]
    [(posn? m)
     (place-image MISSILE (posn-x m) (posn-y m) s)]))

; MAIN /////////////////////////////////////////////////////////////////////////

(define (main state)
  (big-bang state
    [to-draw   render]
    [on-tick   time_step]
    [on-key    control]
    [stop-when game_over?]))