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

(define SCALER 10)

; Scene properties
(define scene_width (* SCALER 50))
(define scene_height (* SCALER 100))

; Tank properties
(define tank_width (* SCALER 10))
(define tank_height (* SCALER 3))
(define TANK_MSPD 4)
(define tank
  (rectangle tank_width tank_height
             "solid" "light steel blue"))

; UFO properties
(define ufo
  (rhombus (* SCALER 5) 45 "solid" "magenta"))

; Background properties
(define bg
  (empty-scene scene_width scene_height))
