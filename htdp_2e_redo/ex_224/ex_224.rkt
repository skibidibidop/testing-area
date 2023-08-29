#|
Author: Mark Beltran
Date: August 29, 2023

Full Space War: As always, a UFO is trying to land on Earth. The player’s task
is to prevent the UFO from landing. To this end, the game comes with a tank
that may fire an arbitrary number of shots. When one of these shots comes
close enough to the UFO’s center of gravity, the game is over and the player
won. If the UFO comes close enough to the ground, the player lost.

Exercise 224. Use the lessons learned from the preceding two sections and design
the game extension slowly, adding one feature of the game after another. Always
use the design recipe and rely on the guidelines for auxiliary functions. If you
like the game, add other features: show a running text; equip the UFO with
charges that can eliminate the tank; create an entire fleet of attacking UFOs;
and above all, use your imagination.
|#

(require 2htdp/image)
(require 2htdp/universe)

; IMAGE CONSTANTS //////////////////////////////////////////////////////////////

(define SCALER 1)
(define SCN_WIDTH  (* SCALER 100))
(define SCN_HEIGHT (* SCALER 200))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define BG SCN_WIDTH SCN_HEIGHT)

(define UFO_IMG
  (circle (* SCALER 30) "solid" "purple"))

(define TANK_IMG
  (rectangle (* SCALER 10) (* SCALER 5) "solid" "light steel blue"))

(define MSL_IMG
  (triangle (* SCALER 3) "outline" "red"))

(define MOVSPD (* SCALER 3))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct w_state [u t lom])
; (make-w_state UFO Tank [List-of Missile])
; Interp.:
; (make-w_state
;  (make-posn 30 40)
;  (make-tank 50 -3)
;  (list
;   (make-posn 20 30)
;   (make-posn 30 40))), represents the current state

; A UFO is a Posn
; Interp.: represents the UFO_IMG's x and y coordinates

(define-struct tank [x v])
; (make-tank Number Number)
; Interp.: (make-ufo 50 -3), represents the TANK's x-coordinate and velocity

; A Missile is a Posn
; Interp.: represents the MSL_IMG's x and y coordinates

; A Valid_key is one of:
; "left"
; "right"
; " "

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; W_state -> Image
; Renders an image based on the current state
(define (render ...) ...)

; W_state -> W_state
; Updates the current state per tick
(define (time_step ...) ...)

; 
; Makes UFO_IMG jump to the left or right randomly per tick
(define (ufo_jump ...) ...)

; W_state Valid_key -> W_state
; Updates the current state based on the key pressed
(define (control ...) ...)

; MAIN /////////////////////////////////////////////////////////////////////////

(define (main ws)
  (big-bang ws
    [to-draw render]
    [on-tick time_step]
    [on-key  control]))
