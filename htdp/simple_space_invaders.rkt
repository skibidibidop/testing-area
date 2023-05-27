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
(define SCENE_WIDTH (* SCALER 50))
(define SCENE_HEIGHT (* SCALER 100))

; Tank properties
(define TANK_WIDTH (* SCALER 10))
(define TANK_HEIGHT (* SCALER 3))
(define TANK_MSPD 4)
(define TANK
  (rectangle TANK_WIDTH TANK_HEIGHT
             "solid" "light steel blue"))

; UFO properties
(define UFO
  (rhombus (* SCALER 5) 45 "solid" "magenta"))

; Background properties
(define BG
  (empty-scene SCENE_WIDTH SCENE_HEIGHT))
