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
(define SCN_HEIGHT  (* SCALER 200))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define FOREST_WIDTH  (* SCALER 95))
(define FOREST_HEIGHT (* SCALER 195))

(define FOREST
  (place-image
   (rectangle FOREST_WIDTH FOREST_HEIGHT "solid" "Dark Olive Green")
   SCN_XCENTER SCN_YCENTER
   (empty-scene SCN_WIDTH SCN_HEIGHT)))

(define BORDER_XGAP
  (- SCN_WIDTH FOREST_WIDTH))
(define BORDER_YGAP
  (- SCN_HEIGHT FOREST_HEIGHT))

(define PLANE
  (triangle (* SCALER 8) "solid" "Light Steel Blue"))
(define PLANE_HALF
  (/ (image-height PLANE) 2))
(define PLANE_YPOS
  (- SCN_HEIGHT
     (+ PLANE_HALF BORDER_YGAP)))

(define FIRE
  (square (* SCALER 7) "solid" "Tomato"))

(define WATER
  (square (* SCALER 7) "solid" "Deep Sky Blue"))
(define WATER_HALF
  (/ (image-height WATER) 2))

(define SHOT_GAP (* SCALER 2))

(define MAX_WATER_DIST
  (+ WATER_HALF SHOT_GAP PLANE_HALF))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct ws [plane water lof])
; (make-ws Plane Water [List-of Fire])
; Interp.: represents the current state

; A Plane is a Number
; Interp.: represents the plane's x coordinate

; A Water is one of:
; #false
; Posn
; Interp.: represents the water shot's x and y coordinates

; A Fire is a Posn
; Interp.: represents the x and y coordinates of a fire in the forest

(define START_STATE
  (make-ws
   SCN_XCENTER
   #false
   '()))
(define FIREY_STATE
  (make-ws
   SCN_XCENTER
   #false
   (list (make-posn 40 50)
         (make-posn 60 80))))
(define SHOOTING_STATE
  (make-ws
   SCN_XCENTER
   (make-posn SCN_XCENTER
              (- PLANE_YPOS
                 (+ PLANE_HALF WATER_HALF)))
   (list (make-posn 40 50)
         (make-posn 60 80))))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Ws -> Image
; Renders an image based on the current state ws
(check-expect (render START_STATE)
              (place-image
               PLANE SCN_XCENTER PLANE_YPOS FOREST))
(check-expect (render FIREY_STATE)
              (place-image
               PLANE SCN_XCENTER PLANE_YPOS
               (place-image
                FIRE 40 50
                (place-image
                 FIRE 60 80 FOREST))))
(check-expect (render SHOOTING_STATE)
              (place-image
               PLANE SCN_XCENTER PLANE_YPOS
               (place-image
                WATER
                SCN_XCENTER
                (- PLANE_YPOS
                   (+ PLANE_HALF WATER_HALF))
                (place-image
                 FIRE 40 50
                 (place-image
                  FIRE 60 80 FOREST)))))

(define (render ws)
  (local
    [; [List-of Fire] -> Image
     (define (gen_fires lof)
       (cond
         [(empty? lof) FOREST]
         [else
          (place-image
           FIRE (posn-x (first lof)) (posn-y (first lof))
           (gen_fires (rest lof)))]))
     
     ; Water Image -> Image
     (define (gen_water w bg)
       (cond
         [(boolean? w) bg]
         [else
          (place-image
           WATER
           (posn-x (ws-water ws))
           (posn-y (ws-water ws))
           bg)]))]
    
    (place-image
     PLANE (ws-plane ws) PLANE_YPOS
     (gen_water
      (ws-water ws)
      (gen_fires (ws-lof ws))))))

; Ws -> Ws
; Updates current state per tick
(check-expect (time_step START_STATE)
              (make-ws
               SCN_XCENTER
               #false
               
               
(define (time_step ws) ws)

; MAIN /////////////////////////////////////////////////////////////////////////
#|
; Wstate -> Wstate
(define (main ws)
  (big-bang ws
    [to-draw render]))
#|
    [on-tick ...]
    [on-key ...]
    [stop-when ...]))
|#

(main START_STATE)
|#
