;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_94) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 24, 2023

Sample Problem
Design a game program using the 2htdp/universe library for playing a
simple space invader game. The player
is in control of a tank (a small rectangle) that must defend our
planet (the bottom of the canvas) from a UFO (see chapter 4.4
for one possibility) that descends from the top of the canvas to
the bottom. In order to stop the UFO from landing, the player
may fire a single missile (a triangle smaller than the tank) by
hitting the space bar. In response, the missile emerges from the
tank. If the UFO collides with the missile, the player wins; oth-
erwise the UFO lands and the player loses.

Here are some details concerning the three game objects and
their movements. First, the tank moves a constant speed along
the bottom of the canvas, though the player may use the left
arrow key and the right arrow key to change directions. Sec-
ond, the UFO descends at a constant velocity but makes small
random jumps to the left or right. Third, once fired, the mis-
sile ascends along a straight vertical line at a constant speed at
least twice as fast as the UFO descends. Finally, the UFO and
the missile collide if their reference points are close enough, for
whatever you think “close enough” means.

Exercise 94. Draw some sketches of what the game scenery looks like at
various stages. Use the sketches to determine the constant and the variable
pieces of the game. For the former, develop physical and graphical con-
stants that describe the dimensions of the world (canvas) and its objects.
Also develop some background scenery. Finally, create your initial scene
from the constants for the tank, the UFO, and the background.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 1) ; Single point of control

(define SCN_WIDTH   (* SCALER 200))
(define SCN_HEIGHT  (* SCALER 400))
(define SCN_XCENTER (/ SCN_WIDTH 2))

(define BG          (empty-scene SCN_WIDTH SCN_HEIGHT))

(define TANK_WIDTH  (* SCALER 50))
(define TANK_HEIGHT (* SCALER 10))
(define TANK        (rectangle TANK_WIDTH TANK_HEIGHT
                               "solid" "light steel blue"))
(define TANK_YPOS   (- SCN_HEIGHT (/ TANK_HEIGHT 2)))

(define UFO_RAD     (* SCALER 30))
(define UFO        (circle UFO_RAD "solid" "dark purple"))
(define UFO_XPOS    SCN_XCENTER)

(define MISSILE_SIDE_SIZE (* SCALER 10))
(define MISSILE (triangle MISSILE_SIDE_SIZE "solid" "red"))
(define MISSILE_START_YPOS (- SCN_HEIGHT
                              (+ TANK_HEIGHT
                                 (/ MISSILE_SIDE_SIZE 2))))

(define TANK_MOVSPD 3)
(define UFO_MOVSPD  1)
(define MSL_MOVSPD  3)

(define INIT_STATE
  (place-images
   (list UFO TANK MISSILE)
   (list (make-posn UFO_XPOS UFO_RAD)
         (make-posn SCN_XCENTER TANK_YPOS)
         (make-posn SCN_XCENTER MISSILE_START_YPOS))
   BG))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; MAIN /////////////////////////////////////////////////////////////////////////
