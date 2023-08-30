#|
Author: Mark Beltran
Date: August 31, 2023

Exercise 225. Design a fire-fighting game.

The game is set in the western states where fires rage through vast forests. It
simulates an airborne fire-fighting effort. Specifically, the player acts as the
pilot of an airplane that drops loads of water on fires on the ground. The
player controls the plane’s horizontal movements and the release of water loads.

Your game software starts fires at random places on the ground. You
may wish to limit the number of fires, making them a function of how many
fires are currently burning or other factors. The purpose of the game is to
extinguish all fires in a limited amount of time.

To do:
--- 
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 3)
(define SCN_WIDTH   (* SCALER 100))
(define SCN_HEIGHT  (* SCALER 250))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define FOREST_WIDTH  (* SCALER 95))
(define FOREST_HEIGHT (* SCALER 245))

(define FOREST
  (place-image
   (rectangle FOREST_WIDTH FOREST_HEIGHT "solid" "Dark Olive Green")
   SCN_XCENTER SCN_YCENTER
   (empty-scene SCN_WIDTH SCN_HEIGHT)))

(define PLANE
  (triangle (* SCALER 5) "solid" "Light Steel Blue"))
(define PLANE_HALF
  (/ (image-height PLANE) 2))

(define FIRE
  (square (* SCALER 7) "solid" "Tomato"))

(define WATER
  (square (* SCALER 4) "solid" "Deep Sky Blue"))
(define WATER_HALF
  (/ (image-height WATER) 2))

(define GAP (* SCALER 2))

(define MAX_WATER_DIST
  (+ WATER_HALF GAP PLANE_HALF))

; DATA DEFINITION //////////////////////////////////////////////////////////////



; FUNCTIONS ////////////////////////////////////////////////////////////////////

; MAIN /////////////////////////////////////////////////////////////////////////
#|
; Wstate -> Wstate
(define (main ws)
  (big-bang ws
    [to-draw render]
    [on-tick ...]
    [on-key ...]
    [stop-when ...]))
|#
