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

(define MSL_IMG (isosceles-triangle
                 (* SCALER 0.5) 30 "solid" "red"))

(define BG (empty-scene SWIDTH SHEIGHT))

; 
