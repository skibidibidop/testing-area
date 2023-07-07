;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname chameleon_pet) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
(define SCN_XCENTER (/ SCN_MAXX 2))
(define BG_PARTITION (/ SCN_MAXX 3))
(define CHAM_ANGLE 140)
(define HG_UP 2)
(define HG_XPOS SCN_XCENTER)
(define HG_YPOS (/ SCALER 2))

(define hgauge
  (place-image
   (rectangle SCN_MAXX SCALER "solid" "purple")
   HG_XPOS HG_YPOS
   (empty-scene SCN_MAXX SCALER)))

(define cham
  (rhombus (* SCALER 4) CHAM_ANGLE "outline" "red"))
(define cham_xhalf (/ (image-width cham) 2))
(define cham_xpos (/ SCN_MAXX 2))
(define cham_ypos (- SCN_MAXY
                     (/ (image-height cham) 2)))

(define bg
  (beside (empty-scene BG_PARTITION SCN_MAXY "green")
          (empty-scene BG_PARTITION SCN_MAXY "white")
          (empty-scene BG_PARTITION SCN_MAXY "red")))

(define-struct vcham [hg x color])
; vcham: a structure
; (make-vcham Number Number String)
; Interpretation: (make-vcham happiness cham_x cham_color)
; - vcham-hg is the happiness gauge's center point.
; The happiness gauge being completely out of the scene
; represents depleted happiness.
; - vcham-x the chameleon's x-coordinate (center point).
; - vcham-color is the chameleon's color.

; vcham -> vcham
; Increases vcham-x by MOVSPD per tick.
; Decreases vcham-hg by HUNGER per tick.
; The chameleon's position resets when its right side touches
; the right border.
(check-expect (time_step (make-vcham HG_XPOS cham_xpos "red"))
              (make-vcham (- HG_XPOS HUNGER) (+ cham_xpos MOVSPD) "red"))
(check-expect (time_step (make-vcham HG_XPOS (- SCN_MAXX cham_xhalf)  "red"))
              (make-vcham (- HG_XPOS HUNGER) cham_xhalf "red"))
(define (time_step chamln)
  (cond[(>= (vcham-x chamln) (- SCN_MAXX cham_xhalf))
        (make-vcham (- (vcham-hg chamln) HUNGER)
                    cham_xhalf
                    (vcham-color chamln))]
       [else (make-vcham (- (vcham-hg chamln) HUNGER)
                         (+ (vcham-x chamln) MOVSPD)
                         (vcham-color chamln))]))

; vcham -> image
; Signals (render) to change the color of cham based on vcham-color
(check-expect (change_color (make-vcham HG_XPOS cham_xpos "red"))
              (rhombus (* SCALER 4) CHAM_ANGLE "outline" "red"))
(define (change_color chamln)
              (cond[(string=? (vcham-color chamln) "red")
                    (rhombus (* SCALER 4) CHAM_ANGLE "outline" "red")]
                   [(string=? (vcham-color chamln) "blue")
                    (rhombus (* SCALER 4) CHAM_ANGLE "outline" "blue")]
                   [(string=? (vcham-color chamln) "green")
                    (rhombus (* SCALER 4) CHAM_ANGLE "outline" "green")]))

; vcham -> Image
; Renders images of the chameleon and happiness gauge depending
; on the current vcham.
(check-expect (render (make-vcham HG_XPOS cham_xpos "red"))
              (place-images (list hgauge
                                  (rhombus (* SCALER 4) CHAM_ANGLE "outline" "red"))
                            (list (make-posn HG_XPOS HG_YPOS)
                                  (make-posn cham_xpos cham_ypos))
                            bg))
(define (render chamln)
  (place-images
   (list hgauge
         (change_color chamln))
   (list (make-posn (vcham-hg chamln) HG_YPOS)
         (make-posn (vcham-x chamln) cham_ypos))
   bg))

; (increment) tester values and results
(define inc_t0 (make-vcham HG_XPOS cham_xpos "red"))
(define inc_r0 (make-vcham HG_XPOS cham_xpos "red"))
(define inc_t1 (make-vcham (- HG_XPOS 1) cham_xpos "red"))
(define inc_r1 (make-vcham HG_XPOS cham_xpos "red"))
(define inc_t2 (make-vcham (- HG_XPOS 2) cham_xpos "red"))
(define inc_r2 (make-vcham HG_XPOS cham_xpos "red"))
(define inc_t3 (make-vcham (- HG_XPOS 3) cham_xpos "red"))
(define inc_r3 (make-vcham (- HG_XPOS 1) cham_xpos "red"))

; vcham String -> vcham
; Allows happiness to be increased up to the max level only (the gauge's
; center point will never move past the scene's center point)
(check-expect (increment inc_t0 "down") inc_r0)
(check-expect (increment inc_t1 "down") inc_r1)
(check-expect (increment inc_t2 "down") inc_r2)
(check-expect (increment inc_t3 "down") inc_r3)
(define (increment chamln ke)
  (cond[(>= (+ (vcham-hg chamln) HG_UP) SCN_XCENTER)
        (make-vcham HG_XPOS (vcham-x chamln) (vcham-color chamln))]
       [else (make-vcham (+ (vcham-hg chamln) HG_UP)
                         (vcham-x chamln)
                         (vcham-color chamln))]))

; (change_mood) test values and results
(define cm_t0 (make-vcham HG_XPOS cham_xpos "red"))
(define cm_t0_r0 (make-vcham HG_XPOS cham_xpos "red"))
(define cm_t0_rred (make-vcham HG_XPOS cham_xpos "red"))
(define cm_t1 (make-vcham (- HG_XPOS 1) cham_xpos "red"))
(define cm_t1_r1 (make-vcham HG_XPOS cham_xpos "red"))
(define cm_t1_rblue (make-vcham (- HG_XPOS 1) cham_xpos "blue"))
(define cm_t2 (make-vcham (- HG_XPOS 3) cham_xpos "red"))
(define cm_t2_r2 (make-vcham (- HG_XPOS 1) cham_xpos "red"))
(define cm_t2_rgreen (make-vcham (- HG_XPOS 3) cham_xpos "green"))

; vcham String -> vcham
; Changes the following properties depending on the keystroke:
; - Happiness can be increased by HG_UP with "down".
; - "r" turns the chameleon red.
; - "b" turns the chameleon blue.
; - "g" turns the chameleon green.
(check-expect (change_mood cm_t0 "down") cm_t0_r0)
(check-expect (change_mood cm_t0 "r") cm_t0_rred)
(check-expect (change_mood cm_t1 "down") cm_t1_r1)
(check-expect (change_mood cm_t1 "b") cm_t1_rblue)
(check-expect (change_mood cm_t2 "down") cm_t2_r2)
(check-expect (change_mood cm_t2 "g") cm_t2_rgreen)
(define (change_mood chamln ke)
  (cond[(key=? ke "down") (increment chamln ke)]
       [(key=? ke "r") (make-vcham (vcham-hg chamln)
                                   (vcham-x chamln)
                                   "red")]
       [(key=? ke "b") (make-vcham (vcham-hg chamln)
                                   (vcham-x chamln)
                                   "blue")]
       [(key=? ke "g") (make-vcham (vcham-hg chamln)
                                   (vcham-x chamln)
                                   "green")]
       [else chamln]))

; initial value for (main)
(define cham_start
  (make-vcham SCN_XCENTER cham_xhalf "red"))

; vcham -> vcham
(define (main cham_init)
  (big-bang cham_init
    [on-tick time_step]
    [on-key change_mood]
    [to-draw render]))

(main cham_start)
