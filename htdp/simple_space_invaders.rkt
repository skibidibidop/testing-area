;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname simple_space_invaders) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; IMAGES ///////////////////////////////////////////////////

(define SCALER 10)

; Scene properties
(define SWIDTH (* SCALER 50))
(define SHEIGHT (* SCALER 100))

; Tank image properties
(define TANK_WIDTH (* SCALER 10))
(define TANK_HEIGHT (* SCALER 3))
(define TANK_YPOS (- SHEIGHT (/ TANK_HEIGHT 2)))
(define TANK_RMSPD 4)
(define TANK_LMSPD -4)
(define TANK_IMG
  (rectangle TANK_WIDTH TANK_HEIGHT
             "solid" "light steel blue"))

; UFO image properties
(define UFO_IMG
  (rhombus (* SCALER 5) 45 "solid" "magenta"))
(define DESCENT_SPD 1)

; Missile image properties
(define MISSILE_IMG
  (isosceles-triangle SCALER 20 "solid" "red")) 
(define ASCENT_SPD (* DESCENT_SPD 3))

; Background properties
(define BG
  (empty-scene SWIDTH SHEIGHT))

; DATA DEFINITIONS /////////////////////////////////////////

; ufo: a posn
; Interp.: location of UFO_IMG
; (define ufo1 (make-posn 5 30))
#;
(define (fn_for_ufo u)
  (...(posn-x u) (posn-y u)))

(define-struct tank [loc vel])
; tank: a structure
; (make-tank Number Number)
; Interp.: (make-tank tank_x tank_dx)
; tank's position is (x, TANK_YPOS)
; tank's velocity is tank_dx pixels/tick
; (define tank1 (make-tank 29 TANK_RMSPD))
; (define tank2 (make-tank 40 TANK_LMSPD))
#;
(define (fn_for_tank t)
  (...(tank-loc t) (tank-vel t)))

; missile: a posn
; Interp.: location of MISSILE_IMG
; (define miss1 (make-posn 20 50))
#;
(define (fn_for_missile msl)
  (...(posn-x msl) (posn-y msl)))

(define-struct aim [ufo tank])
; aim: a structure
; Interp.: game state indicating that missile
; hasn't been fired yet
; (define aim_state ((make-posn 20 10)
;                    (make-tank 40 TANK_RMSPD)))
#;
(define (fn_for_aim u t)
  (...(posn-x u) (posn-y u)
      (tank-loc t) (tank-vel t)))

(define-struct fired [ufo tank missile])
; fired: a structure
; Interp.: game state indicating that the missile
; has been fired
; (define fired_state ((make-posn 20 10)
;                      (make-tank 40 TANK_RMSPD)
;                      (make-posn 30 30)))
#;
(define (fn_for_fired u t m)
  (...(posn-x u) (posn-y u)
      (tank-loc t) (tank-vel t)
      (posn-x m) (posn-y m)))

; gstate is one of:
; -- (make-aim ufo tank)
; -- (make-fired ufo tank missile)
; Interp.: represents complete state of space
; invaders game
;(define game_state1 (make-aim
;                     (make-posn 30 40)
;                     (make-tank 20 TANK_RMSPD)))
;(define game_state2 (make-fired
;                     (make-posn 30 40)
;                     (make-tank 20 TANK_RMSPD)
;                     (make-posn 20 50)))

; FUNCTION DEFINITIONS /////////////////////////////////////

; tank Image -> Image
; Adds t to the given image im
(check-expect (tank_render (make-tank 40 4) BG)
              (place-image TANK_IMG 44 TANK_YPOS BG))
(check-expect (tank_render (make-tank 40 -4) BG)
              (place-image TANK_IMG 36 TANK_YPOS BG))

; (define (tank_render t im) im)
; (define (tank_render t im)
;   (...(tank-loc t) (tank-vel t) im))

(define (tank_render t im)
  (place-image TANK_IMG
               (+ (tank-loc t) (tank-vel t)) TANK_YPOS
               im))

; ufo Image -> Image
; Adds u to the given image im
(check-expect (ufo_render (make-posn 30 50) BG)
              (place-image UFO_IMG 30 50 BG))

; (define (ufo_render u im) im)
; (define (ufo_render u im)
;   (...(posn-x u) (posn-y u) im))

(define (ufo_render u im)
  (place-image UFO_IMG
               (posn-x u) (posn-y u)
               im)) 

; missile Image -> Image
; Adds m to the given image im
(check-expect (missile_render (make-posn 30 20) BG)
              (place-image MISSILE_IMG 30 20 BG))

; (define (missile_render m im) im)
; (define (missile_render m im)
;   (...(posn-x m) (posn-y m) im))

(define (missile_render m im)
  (place-image MISSILE_IMG
               (posn-x m) (posn-y m)
               im))

(define state_t1 (make-aim (make-posn 60 40)
                            (make-tank 30 4)))
(define state_t2 (make-fired (make-posn 50 50)
                              (make-tank 30 -4)
                              (make-posn 20 30)))
; gstate -> Image
; Renders UFO_IMG, TANK_IMG, and MISSILE_IMG on BG
; depending on data from gstate
(check-expect (render state_t1)
              (tank_render
               (aim-tank state_t1)
               (ufo_render (aim-ufo state_t1) BG)))
(check-expect (render state_t2)
              (tank_render
               (fired-tank state_t2)
               (ufo_render
                (fired-ufo state_t2)
                (missile_render
                 (fired-missile state_t2) BG))))

; (define (render gs) im)
; (define (render gs)
;   (cond[(aim? gs)
;         (...(aim-tank gs) (aim-ufo gs) BG)]
;        [(fired? gs)
;         (...(fired-tank gs) (fired-ufo gs) BG)]))

(define (render gs)
  (cond[(aim? gs)
        (tank_render (aim-tank gs)
                     (ufo_render (aim-ufo gs) BG))]
       [(fired? gs)
        (tank_render
         (fired-tank gs)
         (ufo_render
          (fired-ufo gs)
          (missile_render
           (fired-missile gs) BG)))]))

(define XTRIGGER (/ (image-width UFO_IMG) 2))
(define YTRIGGER (+ (/ (image-height UFO_IMG) 2)
                    (/ (image-height MISSILE_IMG) 2)))
(define UFO_YMAX (- SHEIGHT
                    (/ (image-height UFO_IMG) 2)))

(define state_t3 (make-fired (make-posn
                              30 UFO_YMAX)
                             (make-tank 30 4)
                             (make-posn 40 10)))
(define state_t4 (make-fired
                  (make-posn 30 50)
                  (make-tank 30 4)
                  (make-posn
                   (+ 29 ; 1 px less than ufo x-coord
                      (/ (image-width UFO_IMG) 2))
                   (+ 50
                      (/ (image-height UFO_IMG) 2)
                      (/ (image-height MISSILE_IMG) 2)))))
; gstate -> Boolean
; Stops the game if the UFO lands or is hit by a missile
(check-expect (game_over state_t1) #false)
(check-expect (game_over state_t2) #false)
(check-expect (game_over state_t3) #true)
(check-expect (game_over state_t4) #true)

; (define (game_over gs) #true)

(define (game_over gs)
  (cond[(aim? gs)
        (cond[(= (posn-y (aim-ufo gs)) UFO_YMAX) #true]
             [else #false])]
       [(fired? gs)
        (cond[(= (posn-y (fired-ufo gs)) UFO_YMAX) #true]
             [(and (<= (abs (- (posn-x (fired-ufo gs))
                               (posn-x (fired-missile gs))))
                       XTRIGGER)
                   (<= (abs (- (posn-y (fired-ufo gs))
                               (posn-y (fired-missile gs))))
                       YTRIGGER)) #true]
             [else #false])]
       [else #false]))

; gstate -> gstate
; Moves UFO_IMG, TANK_IMG, and MISSILE_IMG per tick
(check-random (move state_t2)
              (make-fired (make-posn (random SWIDTH)
                                     (+ 50 DESCENT_SPD))
                          (make-tank 26 -4)
                          (make-posn 20 (+ 30 ASCENT_SPD))))
; (define (move gs) gs)
(define (move gs)
  (cond[(aim? gs)
        (make-aim
         (make-posn
          (random SWIDTH)
          (+ (posn-y (aim-ufo gs)) DESCENT_SPD))
         (make-tank
          (+ (tank-loc (aim-tank gs))
             (tank-vel (aim-tank gs)))
          (tank-vel (aim-tank gs))))]
        [(fired? gs)
         (make-fired
          (make-posn
           (random SWIDTH)
           (+ (posn-y (fired-ufo gs)) DESCENT_SPD))
          (make-tank
           (+ (tank-loc (fired-tank gs))
              (tank-vel (fired-tank gs)))
           (tank-vel (fired-tank gs)))
          (make-posn
           (posn-x (fired-missile gs))
           (+ (posn-y (fired-missile gs)) ASCENT_SPD)))]
        [else gs]))

; gstate KeyEvent -> gstate
; -- Key event "left" makes tank move to the left
; -- Key event "right makes tank move to the right
; -- Key event " " launches missile if not yet fired
; (check-expect (control ...)...)

; (define (control gs ke) gs)
(define (control gs ke)
  (cond[(aim? gs)
        (cond[(string=? ke "left")
              (make-aim
               (make-posn (random SWIDTH)
                          (+ (posn-y (aim-ufo gs))
                             DESCENT_SPD))
               (make-tank (+ (tank-loc (aim-tank gs))
                             (tank-vel (aim-tank gs)))
                          TANK_LMSPD))]
             [(string=? ke "right")
              (make-aim
               (make-posn (random SWIDTH)
                          (+ (posn-y (aim-ufo gs))
                             DESCENT_SPD))
               (make-tank (+ (tank-loc (aim-tank gs))
                             (tank-vel (aim-tank gs)))
                          TANK_RMSPD))]
             [(string=? ke " ")
              (make-fired
               (make-posn (random SWIDTH)
                          (+ (posn-y (fired-ufo gs))
                             DESCENT_SPD))
               (make-tank (+ (tank-loc (fired-tank gs))
                             (tank-vel (fired-tank gs)))
                          (tank-vel (fired-tank gs)))
               (make-posn (tank-loc (fired-tank gs))
                          TANK_YPOS))]
             [else gs])]
       [(fired? gs)
        (cond[(string=? ke "left")
              (make-fired
               (make-posn (random SWIDTH)
                          (+ (posn-y (fired-ufo gs))
                             DESCENT_SPD))
               (make-tank (+ (tank-loc (fired-tank gs))
                             (tank-vel (fired-tank gs)))
                          (tank-vel (fired-tank gs)))
               (make-posn (posn-x (fired-missile gs))
                          (+ (posn-y (fired-missile gs))
                             ASCENT_SPD)))]
             [(string=? ke "right")
              (make-fired
               (make-posn (random SWIDTH)
                          (+ (posn-y (fired-ufo gs))
                             DESCENT_SPD))
               (make-tank (+ (tank-loc (fired-tank gs))
                             (tank-vel (fired-tank gs)))
                          (tank-vel (fired-tank gs)))
               (make-posn (posn-x (fired-missile gs))
                          (+ (posn-y (fired-missile gs))
                             ASCENT_SPD)))]
             [(and (string=? ke " ")
                   (<= (posn-y (fired-missile gs)) 0))
              (make-fired
               (make-posn (random SWIDTH )
                          (+ (posn-y (fired-ufo gs))
                             DESCENT_SPD))
               (make-tank (+ (tank-loc (fired-tank gs))
                             (tank-vel (fired-tank gs)))
                          (tank-vel (fired-tank gs)))
               (make-posn (tank-loc (fired-tank gs))
                          TANK_YPOS))])]
       [else gs]))

(define (main init)
  (big-bang init
    [to-draw render]
    [on-tick move]
    [on-key control]
    [stop-when game_over]))