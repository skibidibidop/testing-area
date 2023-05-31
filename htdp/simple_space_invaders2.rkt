#|
Author: Mark Beltran
Date: June 1, 2023

Simple space invaders game using a single structure type
to represent the game state.
|#

(require 2htdp/image)
(require 2htdp/universe)

; IMAGES ///////////////////////////////////////////////////

(define SCALER 10)

(define SWIDTH (* SCALER 20))
(define SHEIGHT (* SCALER 10))

(define UFO_IMG (circle (* SCALER 2) "solid" "magenta"))

(define TANK_IMG (rectangle (* SCALER 3) SCALER
                            "solid" "light steel blue"))
(define TANK_YPOS (- SHEIGHT (/ (image-height TANK_IMG) 2)))
(define TANK_RMSPD 3)
(define TANK_LMSPD -3)

(define MSL_IMG (isosceles-triangle
                 (* SCALER 0.5) 30 "solid" "red"))

(define BG (empty-scene SWIDTH SHEIGHT))

; DATA DEFINITIONS /////////////////////////////////////////

; ufo: a Posn
; (make-posn Number Number)
; Interp.: (make-posn xufo yufo)
; Contains x and y coordinates of UFO_IMG
#;
(define (fn_for_ufo u)
  (...(posn-x u) (posn-y u)))

(define-struct tank [loc vel])
; tank: a structure
; (make-tank Number Number)
; Interp.: (make-tank xcoord vel)
; xcoord for the tank's x-coordinate, vel for the tank's
; velocity
#;
(define (fn_for_tank t)
  (...(tank-loc t) (tank-vel t)))

(define-struct missile

(define-struct gstate [ufo tank missile])
; gstate: a structure
; (make-gstate posn 
