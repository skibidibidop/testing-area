;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_97) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

Exercise 97. Design the functions tank-render, ufo-render, and
missile-render. Compare this expression:

(tank-render
 (fired-tank s)
 (ufo-render (fired-ufo s)
             (missile-render (fired-missile s)
                             BG)))
with this one:

(ufo-render
 (fired-ufo s)
 (tank-render (fired-tank s)
              (missile-render (fired-missile s)
                              BG)))

When do the two expressions produce the same result?

They will produce the same result if given the same coordinates
for the tank and the UFO. An abstraction can be created.
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
   (list UFO TANK)
   (list (make-posn UFO_XPOS UFO_RAD)
         (make-posn SCN_XCENTER TANK_YPOS))
   BG))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A SIGS is one of:
; (make-aim UFO Tank)
; (make-fired UFO Tank Missile)
; Interp.: represents the complete state of a space invader game

(define-struct aim [ufo tank])

(define-struct fired [ufo tank missile])

(define-struct tank [loc vel])
; (make-tank Number Number)
; Interp.: (make-tank x dx) contains the tank's x-coordinate and speed in
; pixels per tick

; A UFO is a Posn
; Interp.: (make-posn x y) is the UFO's location using the top-down, left
; to right convention

; A Missile is a Posn
; Interp.: (make-posn x y) is the missile's place

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; SIGS -> Image
; renders the given game state on top of BACKGROUND
(check-expect
 (si-render (make-aim (make-posn 20 30)
                      (make-tank 40 3)))
 (place-image
  TANK 40 TANK_YPOS
  (place-image UFO 20 30 BG)))
(check-expect
 (si-render (make-fired (make-posn 20 30)
                        (make-tank 40 3)
                        (make-posn 40 40)))
 (place-image
  TANK 40 TANK_YPOS
  (place-image
   UFO 20 30
   (place-image
    MISSILE 40 40 BG))))
               
(define (si-render s)
  (cond
    [(aim? s)
     (tank-render (aim-tank s)
                  (ufo-render (aim-ufo s) BG))]
    [(fired? s)
     (tank-render
      (fired-tank s)
      (ufo-render (fired-ufo s)
                  (missile-render (fired-missile s)
                                  BG)))]))

; Tank Image -> Image
; adds t to the given image im
(check-expect (tank-render (make-tank 50 -3) BG)
              (place-image TANK 50 TANK_YPOS BG))

(define (tank-render t im)
  (place-image TANK (tank-loc t) TANK_YPOS im))

; UFO Image -> Image
; adds u to the given image im
(check-expect (ufo-render (make-posn 50 60) BG)
              (place-image UFO 50 60 BG))

(define (ufo-render u im)
  (place-image UFO (posn-x u) (posn-y u) BG))

; Missile Image -> Image
; adds m to the given image im
(check-expect (missile-render (make-posn 40 20) BG)
              (place-image MISSILE 40 20 BG))

(define (missile-render m im)
  (place-image MISSILE (posn-x m) (posn-y m) BG))

; MAIN /////////////////////////////////////////////////////////////////////////