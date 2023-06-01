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

(define SWIDTH (* SCALER 20))
(define SHEIGHT (* SCALER 10))

(define UFO_IMG (circle (* SCALER 2) "solid" "magenta"))
(define UFO_DOWN_SPD 2)
(define SIDE_JUMP_LIM 11)

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

; Test values for function (render)
(define rendert1 (make-gstate (make-posn 30 20)
                              (make-tank 40 TANK_LMSPD)
                              #false))
(define rendert2 (make-gstate (make-posn 40 10)
                              (make-tank 20 TANK_RMSPD)
                              (make-posn 30 30)))

; gstate -> Image
; Renders UFO_IMG, TANK_IMG, MSL_IMG on BG depending on data
; from gstate
(check-expect (render rendert1)
              (place-images
               (list UFO_IMG TANK_IMG MSL_IMG)
               (list (make-posn 30 20)
                     (make-posn 40 TANK_YPOS)
                     (make-posn 40 TANK_YPOS))
               BG))
(check-expect (render rendert2)
              (place-images
               (list UFO_IMG TANK_IMG MSL_IMG)
               (list (make-posn 40 10)
                     (make-posn 20 TANK_YPOS)
                     (make-posn 30 30))
               BG))

; (define (render gs) gs)
(define (render gs)
  (place-images
   (list UFO_IMG TANK_IMG MSL_IMG)
   (list (make-posn
          (posn-x (gstate-u gs))
          (posn-y (gstate-u gs)))
         (make-posn
          (tank-loc (gstate-t gs))
          TANK_YPOS)
         (cond
           ; Missile in tank while not launched
           [(boolean? (gstate-m gs))
            (make-posn
             (tank-loc (gstate-t gs))
             TANK_YPOS)]
           ; Missile's position after launch
           [(posn? (gstate-m gs))
            (make-posn
             (posn-x (gstate-m gs))
             (posn-y (gstate-m gs)))]
           [else gs]))
   BG))

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
                (+ (random SIDE_JUMP_LIM) 30)
                (+ UFO_DOWN_SPD 30))
               (make-tank
                (+ TANK_RMSPD 40)
                TANK_RMSPD)
               (make-posn
                (+ TANK_RMSPD 40)
                TANK_YPOS)))
(check-random (move movet2)
              (make-gstate
               (make-posn
                (+ (random SIDE_JUMP_LIM) 30)
                (+ UFO_DOWN_SPD 40))
               (make-tank
                (+ TANK_LMSPD 30)
                TANK_LMSPD)
               (make-posn
                50
                (+ MSL_UP_SPD 60))))

; (define (move gs) gs)

(define (move gs)
  (make-gstate
   (make-posn
    (+ (random SIDE_JUMP_LIM) (posn-x (gstate-u gs)))
    (+ UFO_DOWN_SPD (posn-y (gstate-u gs))))
   (make-tank
    (+ (tank-loc (gstate-t gs))
       (tank-vel (gstate-t gs)))
    (tank-vel (gstate-t gs)))
   (cond[(boolean? (gstate-m gs))
         (make-posn (+ (tank-loc (gstate-t gs))
                       (tank-vel (gstate-t gs)))
                       TANK_YPOS)]
        [(posn? (gstate-m gs))
         (make-posn (posn-x (gstate-m gs))
                    (+ MSL_UP_SPD
                       (posn-y (gstate-m gs))))]
        [else gs])))

#|
(define (main init)
  (big-bang init
    [to-draw render]
    [on-tick move]
    [on-key control]
    [stop-when game_over]))

(main (make-gstate
       (make-posn...)))
|#
