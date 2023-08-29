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

To do:
--- Borders for UFO
--- Borders for tank
--- Delete missiles outside of scene
|#

(require 2htdp/image)
(require 2htdp/universe)

; IMAGE CONSTANTS //////////////////////////////////////////////////////////////

(define SCALER 2)
(define SCN_WIDTH  (* SCALER 100))
(define SCN_HEIGHT (* SCALER 200))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

(define UFO_IMG
  (circle (* SCALER 7) "solid" "purple"))
(define UFO_CENTER
  (/ (image-width UFO_IMG) 2))
(define UFO_START_XPOS SCN_XCENTER)
(define UFO_START_YPOS UFO_CENTER)
(define UFO_LANDED
  (- SCN_HEIGHT UFO_CENTER))

(define TANK_IMG
  (rectangle (* SCALER 10) (* SCALER 5) "solid" "light steel blue"))
(define TANK_XCENTER
  (/ (image-width TANK_IMG) 2))
(define TANK_YCENTER
  (/ (image-height TANK_IMG) 2))
(define TANK_START_XPOS SCN_XCENTER)
(define TANK_YPOS
  (- SCN_HEIGHT TANK_YCENTER))

(define MSL_IMG
  (square SCALER "outline" "red"))
; MSL_IMG's starting x-coordinate will always be the center of TANK_IMG
(define MSL_START_YPOS
  (- SCN_HEIGHT
     (+ (image-height TANK_IMG)
        (/ (image-height MSL_IMG) 2))))

(define MOVSPD (* SCALER 3))
(define TANK_TO_LEFT  (* MOVSPD -1))
(define TANK_TO_RIGHT MOVSPD)
(define UFO_GO_LEFT  (* MOVSPD -3))
(define UFO_GO_RIGHT (* MOVSPD 3))
(define FALL_SPD MOVSPD)
(define MSL_SPD (* MOVSPD -4))

(define HIT_XLIMIT
  (+ UFO_CENTER
     (/ (image-width MSL_IMG) 2)))
(define HIT_YLIMIT
  (+ UFO_CENTER
     (/ (image-height MSL_IMG) 2)))

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

(define START_STATE
  (make-w_state
   (make-posn UFO_START_XPOS  UFO_START_YPOS)
   (make-tank TANK_START_XPOS TANK_TO_RIGHT)
   '()))
(define MID_STATE
  (make-w_state
   (make-posn SCN_XCENTER SCN_YCENTER)
   (make-tank SCN_XCENTER TANK_TO_LEFT)
   (list (make-posn 90 90)
         (make-posn 80 90))))
(define LANDED
  (make-w_state
   (make-posn SCN_XCENTER UFO_LANDED)
   (make-tank SCN_XCENTER TANK_TO_RIGHT)
   '()))
(define HIT_STATE
  (make-w_state
   (make-posn SCN_XCENTER SCN_YCENTER)
   (make-tank SCN_XCENTER TANK_TO_LEFT)
   (list
    (make-posn SCN_XCENTER
               (+ SCN_YCENTER
                  (/ (image-height UFO_IMG) 2)
                  (/ (image-height MSL_IMG) 2))))))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; W_state -> Image
; Renders an image based on the current state
(check-expect (render START_STATE)
              (place-image
               UFO_IMG UFO_START_XPOS UFO_START_YPOS
               (place-image
                TANK_IMG TANK_START_XPOS TANK_YPOS BG)))
(check-expect (render MID_STATE)
              (place-image
               UFO_IMG SCN_XCENTER SCN_YCENTER
               (place-image
                TANK_IMG SCN_XCENTER TANK_YPOS
                (place-image
                 MSL_IMG 90 90
                 (place-image
                  MSL_IMG 80 90 BG)))))
(check-expect (render LANDED)
              (place-image
               UFO_IMG SCN_XCENTER UFO_LANDED
               (place-image
                TANK_IMG SCN_XCENTER TANK_YPOS BG)))

(define (render ws)
  (local
    [(define (place_missiles lom)
       (cond
         [(empty? lom) BG]
         [else
          (place-image
           MSL_IMG
           (posn-x (first lom))
           (posn-y (first lom))
           (place_missiles (rest lom)))]))]
    
    (place-image
     UFO_IMG (posn-x (w_state-u ws)) (posn-y (w_state-u ws))
     (place-image
      TANK_IMG (tank-x (w_state-t ws)) TANK_YPOS
      (place_missiles (w_state-lom ws))))))

; W_state -> W_state
; Updates the current state per tick
(check-random (time_step START_STATE)
              (make-w_state
               (make-posn (ufo_jump UFO_START_XPOS)
                          (+ UFO_START_YPOS FALL_SPD))
               (make-tank (+ TANK_START_XPOS TANK_TO_RIGHT)
                          TANK_TO_RIGHT)
               '()))
(check-random (time_step MID_STATE)
              (make-w_state
               (make-posn (ufo_jump SCN_XCENTER)
                          (+ SCN_YCENTER FALL_SPD))
               (make-tank (+ SCN_XCENTER TANK_TO_LEFT)
                          TANK_TO_LEFT)
               (list
                (make-posn 90 (+ 90 MSL_SPD))
                (make-posn 80 (+ 90 MSL_SPD)))))

(define (time_step ws)
  (make-w_state
   (make-posn (ufo_jump (posn-x (w_state-u ws)))
              (+ FALL_SPD (posn-y (w_state-u ws))))
   (make-tank (+ (tank-v (w_state-t ws))
                 (tank-x (w_state-t ws)))
              (tank-v (w_state-t ws)))
   (cond
     [(empty? (w_state-lom ws)) '()]
     [else
      (map
       (λ (a_missile)
         (make-posn (posn-x a_missile)
                    (+ MSL_SPD (posn-y a_missile))))
       (w_state-lom ws))])))

; Number -> Number
; Makes UFO_IMG jump to the left or right randomly per tick
(define (ufo_jump n)
  (if (even? (random n))
      (+ n UFO_GO_RIGHT)
      (+ n UFO_GO_LEFT)))

; W_state Valid_key -> W_state
; Updates the current state based on the key pressed
(check-expect (control START_STATE " ")
              (make-w_state
               (make-posn UFO_START_XPOS UFO_START_YPOS)
               (make-tank TANK_START_XPOS TANK_TO_RIGHT)
               (list
                (make-posn TANK_START_XPOS MSL_START_YPOS))))
(check-expect (control START_STATE "left")
              (make-w_state
               (make-posn UFO_START_XPOS UFO_START_YPOS)
               (make-tank TANK_START_XPOS TANK_TO_LEFT)
               '()))
(check-expect (control START_STATE "right") START_STATE)
(check-expect (control MID_STATE " ")
              (make-w_state
               (make-posn SCN_XCENTER SCN_YCENTER)
               (make-tank SCN_XCENTER TANK_TO_LEFT)
               (list
                (make-posn SCN_XCENTER MSL_START_YPOS)
                (make-posn 90 90)
                (make-posn 80 90))))

(define (control ws vk)
  (cond
    [(key=? vk "left")
     (make-w_state
      (w_state-u ws)
      (make-tank (tank-x (w_state-t ws))
                 TANK_TO_LEFT)
      (w_state-lom ws))]
    [(key=? vk "right")
     (make-w_state
      (w_state-u ws)
      (make-tank (tank-x (w_state-t ws))
                 TANK_TO_RIGHT)
      (w_state-lom ws))]
    [(key=? vk " ")
     (make-w_state
      (w_state-u ws)
      (w_state-t ws)
      (cons
       (make-posn (tank-x (w_state-t ws))
                  MSL_START_YPOS)
       (w_state-lom ws)))]
    [else ws]))

; W_state -> Boolean
; Has the UFO landed or has it been hit by a missile
(check-expect (game_over START_STATE) #false)
(check-expect (game_over MID_STATE) #false)
(check-expect (game_over LANDED) #true)
(check-expect (game_over HIT_STATE) #true)

(define (game_over ws)
  (or (>= (posn-y (w_state-u ws))
          UFO_LANDED)
      (foldl
       (λ (m base)
         (or (and
              (<=
               (abs
                (- (posn-x m) (posn-x (w_state-u ws))))
               HIT_XLIMIT)
              (<=
               (abs
                (- (posn-y m) (posn-y (w_state-u ws))))
               HIT_YLIMIT))
             base))
       #false
       (w_state-lom ws))))
   
; MAIN /////////////////////////////////////////////////////////////////////////

(define (main ws)
  (big-bang ws
    [to-draw render]
    [on-tick time_step 0.2]
    [on-key  control]
    [stop-when game_over render]))

(main START_STATE)
