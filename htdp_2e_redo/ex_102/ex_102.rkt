;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_102) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 25, 2023

Exercise 102. Design all other functions that are needed to complete the
game for this second data definition.
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
(define UFO_LANDING_YPOS (- SCN_HEIGHT UFO_RAD))

(define MISSILE_SIDE_SIZE (* SCALER 10))
(define MISSILE (triangle MISSILE_SIDE_SIZE "solid" "red"))

(define TANK_MOVSPD 3)
(define TANK_GO_RIGHT TANK_MOVSPD)
(define TANK_GO_LEFT (* TANK_MOVSPD -1))
(define UFO_MOVSPD  1)
(define MSL_MOVSPD  -3)
(define UFO_SPAZZ_LIM 10)

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct sigs [ufo tank missile])
; A SIGS.v2 (short for SIGS version 2) is a structure:
; (make-sigs UFO Tank MissileOrNot)
; Interp.: represents the complete state of a space invader game

; A UFO is a Posn
; Interp.: represents the x and y coordinates of the UFO

(define-struct tank [loc vel])
; (make-tank Number Number)
; Interp.: (make-tank x v), contains the tank's x-coordinate and velocity

; A MissileOrNot is one of:
; -- #false
; -- Posn
; Interp.: #false means the missile is in the tank;
; Posn says the missile is at that location

; SIGS.v2s for testing
(define AIM_STATE   (make-sigs (make-posn SCN_XCENTER UFO_RAD)
                               (make-tank SCN_XCENTER TANK_GO_RIGHT)
                               #false))
(define FIRED_STATE (make-sigs (make-posn SCN_XCENTER (* UFO_RAD 5))
                               (make-tank SCN_XCENTER TANK_GO_LEFT)
                               (make-posn SCN_XCENTER TANK_YPOS)))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; SIGS.v2 -> Image
; Renders image based on SIGS.v2 s
(check-expect (render AIM_STATE)
              (place-images
               (list UFO TANK)
               (list (make-posn SCN_XCENTER UFO_RAD)
                     (make-posn SCN_XCENTER TANK_YPOS))
               BG))
(check-expect (render FIRED_STATE)
              (place-images
               (list UFO TANK MISSILE)
               (list (make-posn SCN_XCENTER (* UFO_RAD 5))
                     (make-posn SCN_XCENTER TANK_YPOS)
                     (make-posn SCN_XCENTER TANK_YPOS))
              BG))

(define (render s)
   (cond
     [(boolean? (sigs-missile s))
      (place-images
       (list UFO TANK)
       (list (sigs-ufo s)
             (make-posn (tank-loc (sigs-tank s)) TANK_YPOS))
       BG)]
     [else
      (place-images
       (list UFO TANK MISSILE)
       (list (sigs-ufo s)
             (make-posn (tank-loc (sigs-tank s)) TANK_YPOS)
             (sigs-missile s))
       BG)]))

; SIGS.v2 -> SIGS.v2
; Updates SIGS.v2 s per tick
(check-random (time_step AIM_STATE)
              (make-sigs (make-posn
                          (+ SCN_XCENTER (random UFO_SPAZZ_LIM))
                          (+ UFO_RAD UFO_MOVSPD))
                         (make-tank
                          (+ SCN_XCENTER TANK_GO_RIGHT)
                          TANK_GO_RIGHT)
                          #false))
(check-random (time_step FIRED_STATE)
              (make-sigs (make-posn
                          (+ SCN_XCENTER (random UFO_SPAZZ_LIM))
                          (+ (* UFO_RAD 5) UFO_MOVSPD))
                         (make-tank
                          (+ SCN_XCENTER TANK_GO_LEFT)
                          TANK_GO_LEFT)
                         (make-posn
                          SCN_XCENTER
                          (+ TANK_YPOS MSL_MOVSPD))))
                          
(define (time_step s)
  (make-sigs (make-posn
              (+ (posn-x (sigs-ufo s)) (random UFO_SPAZZ_LIM))
              (+ (posn-y (sigs-ufo s)) UFO_MOVSPD))
             (make-tank
              (+ (tank-loc (sigs-tank s)) (tank-vel (sigs-tank s)))
              (tank-vel (sigs-tank s)))
             (cond
               [(boolean? (sigs-missile s)) #false]
               [else
                (make-posn
                 (posn-x (sigs-missile s))
                 (+ (posn-y (sigs-missile s)) MSL_MOVSPD))])))

; SIGS.v2 KeyEvent -> SIGS.v2
; Updates SIGS.v2 s based on KeyEvent ke
(check-expect (control AIM_STATE "left")
              (make-sigs (sigs-ufo AIM_STATE)
                         (make-tank SCN_XCENTER TANK_GO_LEFT)
                         #false))
(check-expect (control AIM_STATE " ")
              (make-sigs (sigs-ufo AIM_STATE)
                         (sigs-tank AIM_STATE)
                         (make-posn SCN_XCENTER TANK_YPOS)))
(check-expect (control FIRED_STATE "right")
              (make-sigs (sigs-ufo FIRED_STATE)
                         (make-tank SCN_XCENTER TANK_GO_RIGHT)
                         (sigs-missile FIRED_STATE)))
(check-expect (control FIRED_STATE "left") FIRED_STATE)
(check-expect (control FIRED_STATE " ") FIRED_STATE)

(define (control s ke)
  (make-sigs (sigs-ufo s)
             (make-tank
              (tank-loc (sigs-tank s))
              (cond
                [(key=? ke "left") TANK_GO_LEFT]
                [(key=? ke "right") TANK_GO_RIGHT]
                [else (tank-vel (sigs-tank s))]))
             (cond
               [(and (key=? ke " ")
                     (boolean? (sigs-missile s)))
                (make-posn (tank-loc (sigs-tank s)) TANK_YPOS)]
               [else (sigs-missile s)])))

; SIGS.v2 -> Boolean
; Did the missile hit the UFO or has the UFO landed
(check-expect (game_over? AIM_STATE) #false)
(check-expect (game_over? FIRED_STATE) #false)
(check-expect (game_over?
               (make-sigs (make-posn SCN_XCENTER UFO_LANDING_YPOS)
                          (make-tank SCN_XCENTER TANK_YPOS)
                          #false))
              #true)
(check-expect (game_over?
               (make-sigs  (make-posn SCN_XCENTER UFO_RAD)
                           (make-tank SCN_XCENTER TANK_YPOS)
                           (make-posn SCN_XCENTER
                                      (+ UFO_RAD
                                         (/ (image-height MISSILE) 2)))))
              #true)

(define (game_over? s)
  (cond
    [(>= (posn-y (sigs-ufo s)) UFO_LANDING_YPOS) #true]
    [(boolean? (sigs-missile s)) #false]
    [else
     (and (<= (abs
               (- (posn-x (sigs-ufo s))
                  (posn-x (sigs-missile s))))
              UFO_RAD)
          (<= (abs
               (- (posn-y (sigs-ufo s))
                  (posn-y (sigs-missile s))))
              UFO_RAD))]))

; MAIN /////////////////////////////////////////////////////////////////////////

(define (main state)
  (big-bang state
    [to-draw   render]
    [on-tick   time_step]
    [on-key    control]
    [stop-when game_over?]))