#|
Author: Mark Beltran
Date: May 26, 2023

- Chameleon walks from left to right.
- If right border is reached, teleport to left border.
- Happiness gauge decreases over time.
- Happiness can be increased by 2 with keystroke "down".
- Keystroke "r" turns the chameleon red.
- Keystroke "b" turns the chameleon blue.
- Keystroke "g" turns the chameleon green.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)
(define MOVSPD 3)
(define HUNGER 0.1)
(define SCN_MINX 0)
(define SCN_MAXX (* SCALER 30))
(define SCN_MINY 0)
(define SCN_MAXY (* SCALER 10))
(define CHAM_ANGLE 80)

(define hgauge
  (rectangle SCN_MAXX SCALER "solid" "red"))
(define hg_xpos (/ SCN_MAXX 2))

(define cham
  (rhombus (* SCALER 4) CHAM_ANGLE "outline" "black"))
(define cham_xhalf (/ (image-width cham) 2))
(define cham_xpos (/ SCN_MAXX 2))

(define-struct vcham [hg x color])
; vcham: a structure
; (make-vcham Number Number String)
; Interpretation: (make-vcham happiness cham_x cham_color)
; - vcham-hg is the happiness gauge's center point.
; The happiness gauge being completely out of the scene
; represents depleted happiness.
; - vcham-x the chameleon's x-coordinate (center point).
; - vcham-color is the chameleon's color.

; wstate -> wstate
; Increases vcham-x by MOVSPD per tick.
; Decreases vcham-hg by HUNGER per tick.
; The chameleon's position resets when its right side touches
; the right border.
(check-expect (time_step (make-vcham hg_xpos cham_xpos "red"))
              (make-vcham (- hg_xpos HUNGER) (+ cham_xpos MOVSPD) "red"))
(check-expect (time_step (make-vcham hg_xpos (- SCN_MAXX cham_xhalf)  "red"))
              (make-vcham (- hg_xpos HUNGER) cham_xhalf "red"))
(define (time_step chamln)
  (cond[(>= (vcham-x chamln) (- SCN_MAXX cham_xhalf))
        (make-vcham (- (vcham-hg chamln) HUNGER)
                    cham_xhalf
                    (vcham-color chamln))]
       [else (make-vcham (- (vcham-hg chamln) HUNGER)
                         (+ (vcham-x chamln) MOVSPD)
                         (vcham-color chamln))]))

