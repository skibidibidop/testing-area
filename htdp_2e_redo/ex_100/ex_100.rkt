;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_100) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

Exercise 100. Design the function si-control, which plays the role of
the key-event handler. As such, it consumes a game state and a KeyEvent
and produces a new game state. It reacts to three different keys:

• pressing the left arrow ensures that the tank moves left;
• pressing the right arrow ensures that the tank moves right; and
• pressing the space bar fires the missile if it hasn’t been launched yet.

Once you have this function, you can define the si-main function,
which uses big-bang to spawn the game-playing window. Enjoy!
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 1) ; Single point of control

(define SCN_WIDTH   (* SCALER 200))
(define SCN_HEIGHT  (* SCALER 400))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define BG          (empty-scene SCN_WIDTH SCN_HEIGHT))

(define TANK_WIDTH  (* SCALER 50))
(define TANK_HEIGHT (* SCALER 10))
(define TANK        (rectangle TANK_WIDTH TANK_HEIGHT
                               "solid" "light steel blue"))
(define TANK_YPOS   (- SCN_HEIGHT (/ TANK_HEIGHT 2)))

(define UFO_RAD     (* SCALER 30))
(define UFO        (circle UFO_RAD "solid" "dark purple"))
(define UFO_XPOS    SCN_XCENTER)
(define UFO_LANDING_YPOS (- SCN_HEIGHT UFO_RAD))

(define MISSILE_SIDE_SIZE (* SCALER 10))
(define MISSILE (triangle MISSILE_SIDE_SIZE "solid" "red"))
(define MISSILE_START_YPOS (- SCN_HEIGHT
                              (+ TANK_HEIGHT
                                 (/ MISSILE_SIDE_SIZE 2))))

(define TANK_MOVSPD 3)
(define TANK_GO_RIGHT TANK_MOVSPD)
(define TANK_GO_LEFT (* TANK_MOVSPD -1))
(define UFO_MOVSPD  1)
(define MSL_MOVSPD  -3)
(define UFO_SPAZZ_LIM 10)

(define FONT_SIZE (* SCALER 30))
(define FONT_COLOR "red")

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
     (place-images
      (list UFO TANK)
      (list (make-posn
             (posn-x (aim-ufo s)) (posn-y (aim-ufo s)))
            (make-posn
             (tank-loc (aim-tank s)) TANK_YPOS))
      BG)]
    [(fired? s)
     (place-images
      (list UFO TANK MISSILE)
      (list (make-posn
             (posn-x (fired-ufo s)) (posn-y (fired-ufo s)))
            (make-posn
             (tank-loc (fired-tank s)) TANK_YPOS)
            (make-posn
             (posn-x (fired-missile s)) (posn-y (fired-missile s))))
      BG)]))

; SIGS -> Boolean
; Has the UFO landed or has the missile hit the UFO
(check-expect (si-game-over?
               (make-aim (make-posn 30 40)
                         (make-tank 30 TANK_YPOS)))
              #false)
(check-expect (si-game-over?
               (make-aim (make-posn 30 UFO_LANDING_YPOS)
                         (make-tank 80 TANK_YPOS)))
              #true)
(check-expect (si-game-over?
               (make-fired (make-posn 30 40)
                           (make-tank 30 TANK_YPOS)
                           (make-posn 30 70)))
              #true)
(check-expect (si-game-over?
               (make-fired (make-posn 30 UFO_LANDING_YPOS)
                           (make-tank 80 TANK_YPOS)
                           (make-posn 30 70)))
              #true)
(check-expect (si-game-over?
               (make-fired (make-posn 30 40)
                           (make-tank 80 TANK_YPOS)
                           (make-posn 50 80)))
              #false)

(define (si-game-over? s)
  (cond
    [(aim? s)
     (>= (posn-y (aim-ufo s)) UFO_LANDING_YPOS)]
    [(fired? s)
     (cond
       [(>= (posn-y (fired-ufo s)) UFO_LANDING_YPOS) #true]
       [(and (<= (abs
                  (- (posn-x (fired-ufo s))
                     (posn-x (fired-missile s))))
                 UFO_RAD)
             (<= (abs
                  (- (posn-y (fired-ufo s))
                     (posn-y (fired-missile s))))
                 UFO_RAD))
        #true]
       [else #false])]))

; SIGS -> Image
; Displays "Game over!" if si-game-over?
(define (si-render-move s)
  (place-image
   (text "Game over!" FONT_SIZE FONT_COLOR)
   SCN_XCENTER SCN_YCENTER
   BG))

; SIGS -> SIGS
; Updates SIGS s every tick
(define (si-move s)
  (si-move-proper s (random UFO_SPAZZ_LIM)))

; SIGS Number -> SIGS
; Moves the space-invader objects predictably by delta
(define (si-move-proper w delta)
  (cond
    [(aim? w)
     (make-aim
      (make-posn
       (if (= (modulo delta 2) 0)
           (+ (posn-x (aim-ufo w)) delta)
           (- (posn-x (aim-ufo w)) delta))
       (+ (posn-y (aim-ufo w)) UFO_MOVSPD))
      (make-tank (+ (tank-loc (aim-tank w))
                    (tank-vel (aim-tank w)))
                 (tank-vel (aim-tank w))))]
    [(fired? w)
     (make-fired
      (make-posn
       (if (= (modulo delta 2) 0)
           (+ (posn-x (fired-ufo w)) delta)
           (- (posn-x (fired-ufo w)) delta))
       (+ (posn-y (fired-ufo w)) UFO_MOVSPD))
      (make-tank (+ (tank-loc (fired-tank w))
                    (tank-vel (fired-tank w)))
                 (tank-vel (fired-tank w)))
      (make-posn (posn-x (fired-missile w))
                 (+ (posn-y (fired-missile w))
                    MSL_MOVSPD)))]))

; SIGS KeyEvent -> SIGS
; Updates SIGS s based on KeyEvent ke
(define aim_state (make-aim
                   (make-posn UFO_XPOS UFO_RAD)
                   (make-tank SCN_XCENTER TANK_GO_RIGHT)))
(define fired_state (make-fired
                     (make-posn UFO_XPOS UFO_RAD)
                     (make-tank SCN_XCENTER TANK_GO_RIGHT)
                     (make-posn SCN_XCENTER SCN_YCENTER)))

(define (si-control s ke)
  (cond
    [(and (aim? s)
          (or (key=? ke "left")
              (key=? ke "right")))
     (make-aim (aim-ufo s)
               (make-tank (tank-loc (aim-tank s))
                          (cond
                            [(key=? ke "left") TANK_GO_LEFT]
                            [(key=? ke "right") TANK_GO_RIGHT])))]
    [(and (aim? s)
          (key=? ke " "))
     (make-fired (aim-ufo s)
                 (aim-tank s)
                 (make-posn (tank-loc (aim-tank s))
                            TANK_YPOS))]
    [(fired? s)
     (cond
       [(key=? ke " ") s]
       [else
        (make-fired (fired-ufo s)
                    (make-tank (tank-loc (fired-tank s))
                               (cond
                                 [(key=? ke "left") TANK_GO_LEFT]
                                 [(key=? ke "right") TANK_GO_RIGHT]
                                 [else (tank-vel (fired-tank s))]))
                    (fired-missile s))])]
    [else s]))


; MAIN /////////////////////////////////////////////////////////////////////////

; SIGS -> SIGS
(define (si-main state)
  (big-bang state
    [to-draw   si-render]
    [on-tick   si-move]
    [on-key    si-control]
    [stop-when si-game-over? si-render-move]))

(si-main aim_state)