;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname simple_space_invaders2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 1, 2023

Simple space invaders game using a single structure type
to represent the game state.
|#

(require 2htdp/image)
(require 2htdp/universe)

; IMAGES ///////////////////////////////////////////////////

(define SCALER 10)

(define SWIDTH (* SCALER 50))
(define SHEIGHT (* SCALER 50))
(define S_XCENTER (/ SWIDTH 2))

(define UFO_IMG (circle (* SCALER 2) "solid" "magenta"))
(define UFO_DOWN_SPD 2)
(define SIDE_JUMP_LIM 11)
(define UFO_LANDED (- SHEIGHT
                      (/ (image-height UFO_IMG) 2)))

(define TANK_IMG (rectangle (* SCALER 3) SCALER
                            "solid" "light steel blue"))
(define TANK_YPOS (- SHEIGHT (/ (image-height TANK_IMG) 2)))
(define TANK_RMSPD 3)
(define TANK_LMSPD -3)

(define MSL_IMG (isosceles-triangle
                 (* SCALER 0.5) 30 "solid" "red"))
(define MSL_UP_SPD (* (* UFO_DOWN_SPD 5) -1))

(define BG (empty-scene SWIDTH SHEIGHT))

; DATA DEFINITIONS /////////////////////////////////////////

; ufo: a Posn
; (make-posn Number Number)
; Interp.: (make-posn xufo yufo)
; Contains x and y coordinates of UFO_IMG
#;
(define (fn_for_ufo u)
  (...(posn-x u) (posn-y u)))

(define-struct tank [loc vel])
; tank: a structure
; (make-tank Number Number)
; Interp.: (make-tank xcoord vel)
; xcoord for the tank's x-coordinate, vel for the tank's
; velocity
#;
(define (fn_for_tank t)
  (...(tank-loc t) (tank-vel t)))

; a missile_stat is one of:
; -- #false
; -- Posn
; Interp.:
; #false    : missile is in tank
; Posn      : position of missile after firing
; (define mstat1 #false))
; (define mstat2 (make-posn 30 20))
#;
(define (fn_for_missile_stat ms)
  (cond[(false? ms) (...)]
       [(posn? ms) (...(posn-x ms) (posn-y ms))]))

(define-struct gstate [u t m])
; gstate: a structure
; (make-gstate Posn tank missile_stat)
; Interp.: represents complete state of this simple space
; invaders game
; (define g1 (make-gstate (make-posn 30 20)
;                         (make-tank 40 TANK_LMSPD)
;                         #false))
; (define g2 (make-gstate (make-posn 30 20)
;                         (make-tank 50 TANK_RMSPD)
;                         (make-posn 50 40)))
#;
(define (fn_for_gstate gs)
  (..
   (posn-x (gstate-u gs)) (posn-y (gstate-u gs))
   (tank-loc (gstate-tank gs)) (tank-vel (gstate-tank gs))
   (posn-x (gstate-m gs)) (posn-y (gstate-m gs))))

; FUNCTION DEFINITIONS /////////////////////////////////////

(define rendert1
  (make-gstate
   (make-posn 30 40)
   (make-tank 50 TANK_RMSPD)
   #false))

; gstate Image -> Image
; Puts UFO_IMG on given image and outputs new image
(check-expect (ufo_render rendert1 BG)
              (place-image UFO_IMG 30 40 BG))

(define (ufo_render gs img)
  (place-image UFO_IMG
               (posn-x (gstate-u gs))
               (posn-y (gstate-u gs))
               img))

; gstate Image -> Image
; Puts TANK_IMG on given image and outputs new image
(check-expect (tank_render rendert1 BG)
              (place-image TANK_IMG 50 TANK_YPOS BG))

(define (tank_render gs img)
  (place-image TANK_IMG
               (tank-loc (gstate-t gs)) TANK_YPOS
               img))

; gstate Image -> Image
; Puts MSL_IMG on given image and outputs new image
(check-expect (missile_render rendert1 BG)
              (place-image MSL_IMG 50 TANK_YPOS BG))
(check-expect (missile_render
               (make-gstate
                (make-posn 20 50)
                (make-tank 70 TANK_LMSPD)
                (make-posn 80 90))
               BG)
              (place-image MSL_IMG 80 90 BG))

(define (missile_render gs img)
  (cond[(boolean? (gstate-m gs))
        (place-image MSL_IMG
                     (tank-loc (gstate-t gs))
                     TANK_YPOS
                     img)]
       [(posn? (gstate-m gs))
        (place-image MSL_IMG
                     (posn-x (gstate-m gs))
                     (posn-y (gstate-m gs))
                     img)]))

; gstate -> Image
; Render all images, with positions based on gstate
(check-expect (render
               (make-gstate
                (make-posn 50 80)
                (make-tank 30 TANK_LMSPD)
                #false))
              (place-image
               UFO_IMG 50 80
               (place-image
                TANK_IMG 30 TANK_YPOS
                (place-image
                 MSL_IMG 30 TANK_YPOS BG))))
(check-expect (render
               (make-gstate
                (make-posn 30 50)
                (make-tank 75 TANK_RMSPD)
                (make-posn 80 90)))
              (place-image
               UFO_IMG 30 50
               (place-image
                TANK_IMG 75 TANK_YPOS
                (place-image
                 MSL_IMG 80 90 BG))))

(define (render gs)
  (ufo_render gs
              (tank_render gs
                           (missile_render gs BG))))

; Number -> Number
; Generate random number; negative if even, positive if odd
(define (rand_jump n)
  (cond[(= (modulo (random n) 2) 0)
        (* (random n) -1)]
       [else (random n)]))

; Test values for function (move)
(define movet1 (make-gstate
                (make-posn 30 30)
                (make-tank 40 TANK_RMSPD)
                #false))
(define movet2 (make-gstate
                (make-posn 30 40)
                (make-tank 30 TANK_LMSPD)
                (make-posn 50 60)))

; gstate -> gstate
; Provides updated locations for UFO_IMG, TANK_IMG,
; and MSL_IMG per tick
(check-random (move movet1)
              (make-gstate
               (make-posn
                (+ (rand_jump SIDE_JUMP_LIM) 30)
                (+ UFO_DOWN_SPD 30))
               (make-tank
                (+ TANK_RMSPD 40)
                TANK_RMSPD)
               #false))
(check-random (move movet2)
              (make-gstate
               (make-posn
                (+ (rand_jump SIDE_JUMP_LIM) 30)
                (+ UFO_DOWN_SPD 40))
               (make-tank
                (+ TANK_LMSPD 30)
                TANK_LMSPD)
               (make-posn
                50
                (+ MSL_UP_SPD 60))))

(define (move gs)
  (make-gstate
   (make-posn
    (+ (rand_jump SIDE_JUMP_LIM) (posn-x (gstate-u gs)))
    (+ UFO_DOWN_SPD (posn-y (gstate-u gs))))
   (make-tank
    (+ (tank-loc (gstate-t gs))
       (tank-vel (gstate-t gs)))
    (tank-vel (gstate-t gs)))
   (cond[(boolean? (gstate-m gs)) #false]
        [(posn? (gstate-m gs))
         (cond[(<= (posn-y (gstate-m gs)) 0)
               #false]
              [else
               (make-posn (posn-x (gstate-m gs))
                          (+ MSL_UP_SPD
                             (posn-y (gstate-m gs))))])]
        [else gs])))

; Test values for function (control)
(define controlt1 (make-gstate
                   (make-posn 40 30)
                   (make-tank 50 TANK_RMSPD)
                   #false))
(define controlt2 (make-gstate
                    (make-posn 20 30)
                    (make-tank 40 TANK_LMSPD)
                    (make-posn 50 50)))

; gstate KeyEvent -> gstate
; Modifies gstate based on KeyEvent
(check-expect (control controlt1 "right")
              (make-gstate
               (make-posn 40 30)
               (make-tank 50 TANK_RMSPD)
               #false))
(check-expect (control controlt1 "left")
              (make-gstate
               (make-posn 40 30)
               (make-tank 50 TANK_LMSPD)
               #false))
(check-expect (control controlt1 " ")
              (make-gstate
               (make-posn 40 30)
               (make-tank 50 TANK_RMSPD)
               (make-posn 50 TANK_YPOS)))

(define (control gs ke)
  (cond[(string=? ke "right")
        (make-gstate
         (make-posn
          (posn-x (gstate-u gs))
          (posn-y (gstate-u gs)))
         (make-tank
          (tank-loc (gstate-t gs))
          TANK_RMSPD)
         (gstate-m gs))]
       [(string=? ke "left")
        (make-gstate
         (make-posn
          (posn-x (gstate-u gs))
          (posn-y (gstate-u gs)))
         (make-tank
          (tank-loc (gstate-t gs))
          TANK_LMSPD)
         (gstate-m gs))]
       [(and (string=? ke " ")
             (boolean? (gstate-m gs)))
        (make-gstate
         (make-posn
          (posn-x (gstate-u gs))
          (posn-y (gstate-u gs)))
         (make-tank
          (tank-loc (gstate-t gs))
          (tank-vel (gstate-t gs)))
         (make-posn
          (tank-loc (gstate-t gs))
          TANK_YPOS))]
       [else gs]))

(define XTRIGGER (/ (image-width UFO_IMG) 2))
(define YTRIGGER
  (+ (/ (image-height UFO_IMG) 2)
     (/ (image-height MSL_IMG) 2)))

; gstate -> Boolean
; Stops program if the UFO lands or if the UFO is hit
; by the missile.
(check-expect (game_over (make-gstate
                          (make-posn 30 UFO_LANDED)
                          (make-tank 50 TANK_YPOS)
                          #false))
              #true)
(check-expect (game_over (make-gstate
                          (make-posn 80 50)
                          (make-tank 50 TANK_YPOS)
                          (make-posn 89 59)))
              #true)
(check-expect (game_over (make-gstate
                          (make-posn 80 50)
                          (make-tank 50 TANK_YPOS)
                          (make-posn 130 80)))
              #false)

(define (game_over gs)
  (cond
    [(and (boolean? (gstate-m gs))
          (>= (posn-y (gstate-u gs)) UFO_LANDED))
     #true]
    [(posn? (gstate-m gs))
     (cond
       [(and (<= (abs
                  (- (posn-x (gstate-u gs))
                     (posn-x (gstate-m gs))))
                 XTRIGGER)
             (<= (abs
                  (- (posn-y (gstate-u gs))
                     (posn-y (gstate-m gs))))
                 YTRIGGER))
        #true]
       [else #false])]
     [else #false]))

(define (main init)
  (big-bang init
    [to-draw render]
    [on-tick move]
    [on-key control]
    [stop-when game_over]))

(main (make-gstate
       (make-posn S_XCENTER
                  (/ (image-height UFO_IMG) 2))
       (make-tank S_XCENTER TANK_RMSPD)
       #false))
