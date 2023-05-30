;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname simple_space_invaders) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 27, 2023

Simple space invaders game
Tank
 * Controlled by player
 * Can fire a missile
 * Moves across canvas at constant velocity,
   direction can be changed with arrow keys

UFO
 * Descends from top to bottom of canvas at
   constant velocity
 * Randomly makes small jumps (left or right)

Missile
 * Smaller than the tank
 * Triggered by key event spacebar
 * Ascends vertically at constant velocity, at
 * least 2x as fast as UFO

Win: missile collides with UFO
Lose: UFO lands
|#

(require 2htdp/universe)
(require 2htdp/image)

; IMAGES ///////////////////////////////////////////////////

(define SCALER 10)

; Scene properties
(define SWIDTH (* SCALER 50))
(define SHEIGHT (* SCALER 100))

; Tank image properties
(define TANK_WIDTH (* SCALER 10))
(define TANK_HEIGHT (* SCALER 3))
(define TANK_YPOS (- SHEIGHT (/ TANK_HEIGHT 2)))
(define TANK_RMSPD 4)
(define TANK_LMSPD -4)
(define TANK_IMG
  (rectangle TANK_WIDTH TANK_HEIGHT
             "solid" "light steel blue"))

; UFO image properties
(define UFO_IMG
  (rhombus (* SCALER 5) 45 "solid" "magenta"))
(define DESCENT_SPD 1)

; Missile image properties
(define MISSILE_IMG
  (isosceles-triangle SCALER 20 "solid" "red")) 
(define ASCENT_SPD (* DESCENT_SPD 3))

; Background properties
(define BG
  (empty-scene SWIDTH SHEIGHT))

; DATA DEFINITIONS /////////////////////////////////////////

; ufo: a posn
; Interp.: location of UFO_IMG
; (define ufo1 (make-posn 5 30))
#;
(define (fn_for_ufo u)
  (...(posn-x u) (posn-y u)))

(define-struct tank [loc vel])
; tank: a structure
; (make-tank Number Number)
; Interp.: (make-tank tank_x tank_dx)
; tank's position is (x, TANK_YPOS)
; tank's velocity is tank_dx pixels/tick
; (define tank1 (make-tank 29 TANK_RMSPD))
; (define tank2 (make-tank 40 TANK_LMSPD))
#;
(define (fn_for_tank t)
  (...(tank-loc t) (tank-vel t)))

; missile: a posn
; Interp.: location of MISSILE_IMG
; (define miss1 (make-posn 20 50))
#;
(define (fn_for_missile msl)
  (...(posn-x msl) (posn-y msl)))

(define-struct aim [ufo tank])
; aim: a structure
; Interp.: game state indicating that missile
; hasn't been fired yet
; (define aim_state ((make-posn 20 10)
;                    (make-tank 40 TANK_RMSPD)))
#;
(define (fn_for_aim u t)
  (...(posn-x u) (posn-y u)
      (tank-loc t) (tank-vel t)))

(define-struct fired [ufo tank missile])
; fired: a structure
; Interp.: game state indicating that the missile
; has been fired
; (define fired_state ((make-posn 20 10)
;                      (make-tank 40 TANK_RMSPD)
;                      (make-posn 30 30)))
#;
(define (fn_for_fired u t m)
  (...(posn-x u) (posn-y u)
      (tank-loc t) (tank-vel t)
      (posn-x m) (posn-y m)))

; gstate is one of:
; -- (make-aim ufo tank)
; -- (make-fired ufo tank missile)
; Interp.: represents complete state of space
; invaders game
;(define game_state1 (make-aim
;                     (make-posn 30 40)
;                     (make-tank 20 TANK_RMSPD)))
;(define game_state2 (make-fired
;                     (make-posn 30 40)
;                     (make-tank 20 TANK_RMSPD)
;                     (make-posn 20 50)))

; FUNCTION DEFINITIONS /////////////////////////////////////

; tank Image -> Image
; Adds t to the given image im
(define (tank_render t im) im)

; ufo Image -> Image
; Adds u to the given image im
(define (ufo_render u im) im)

; missile Image -> Image
; Adds m to the given image im
(define (missile_render m im) im)

; gstate -> Image
; Renders UFO_IMG, TANK_IMG, and MISSILE_IMG on BG
; depending on data from gstate
(define (render gs)
  (cond[(aim? gs)
        (tank_render (aim-tank gs)
                     (ufo_render (aim-ufo gs) BG))]
       [(fired? gs)
        (tank_render
         (fired-tank gs)
         (ufo_render
          (fired-ufo gs)
          (missile_render
           (fired-missile gs) BG)))]))