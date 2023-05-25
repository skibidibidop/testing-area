;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cat_pet_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 25, 2023

Virtual Cat Pet 2: Electric Boogaloo
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 20)
(define MOVSPD 3)

(define scn_width (* SCALER 10))
(define scn_height (* SCALER 5))
(define scn_xcenter (/ scn_width 2))
(define scn_ycenter (/ scn_height 2))

(define cat (circle (* SCALER 1) "solid" "brown"))
(define xhalf_cat (/ (image-width cat) 2))
(define hgauge (rectangle scn_width (* SCALER 0.5) "solid" "red"))
(define xhalf_hgauge (/ (image-width hgauge) 2))
(define bg (empty-scene scn_width scn_height))
(define cat_ypos (- scn_height (/ (image-height cat) 2)))
(define hgauge_ypos (/ (image-height hgauge) 2))
(define hgauge_maxpos scn_xcenter)

(define-struct wstate [h x d])
; wstate: a structure
; (make-wstate Number Number String)
; Interpretation: (make-wstate happiness x-coord direction)
; h represents the distance between the happiness gauge's
; right edge and the right border. Increases per tick to
; signify decreasing happiness.
; x represents the x-coordinate of the cat. This changes
; by MOVSPD per tick.
; d represents the movement direction of the cat which
; changes when a border is reached.

; wstate -> wstate
; Per tick, increases the distance between the happiness
; gauge's right edge and the right border.
; Per tick, increases the cat's x-coordinate by MOVSPD.
; If the right border is reached, movement direction is
; changed to leftward and vice versa.
(check-expect (time_step (make-wstate
                          scn_width scn_width
                          "right"))
              (make-wstate
               (- scn_width 1) (+ scn_width MOVSPD)
               "left"))
(check-expect (time_step (make-wstate
                          scn_width (+ scn_width 1)
                          "left"))
              (make-wstate
               (- scn_width 1) (- (+ scn_width 1) MOVSPD)
               "left"))
(check-expect (time_step (make-wstate
                          scn_width 0
                          "left"))
              (make-wstate
               (- scn_width 1) (- 0 MOVSPD)
               "right"))
(check-expect (time_step (make-wstate
                         scn_width -3
                         "right"))
              (make-wstate
               (- scn_width 1) (+ -3 MOVSPD)
               "right"))
(check-expect (time_step (make-wstate
                          scn_width 5
                          "left"))
              (make-wstate
               (- scn_width 1) (- 5 MOVSPD)
               "right"))
(check-expect (time_step (make-wstate
                          scn_width 10
                          "right"))
              (make-wstate
               (- scn_width 1) (+ 10 MOVSPD)
               "right"))
(define (time_step stat)
  (make-wstate (cond[(<= (- (wstate-h stat) 1) (- 0 xhalf_hgauge))
                     (- 0 xhalf_hgauge)]
                    [else (- (wstate-h stat) 1)])
               (cond[(string=? (wstate-d stat) "right")
                     (+ (wstate-x stat) MOVSPD)]
                    [(string=? (wstate-d stat) "left")
                     (- (wstate-x stat) MOVSPD)]
                    [else (wstate-x stat)])
               (cond[(>= (wstate-x stat) (- scn_width xhalf_cat)) "left"]
                    [(<= (wstate-x stat) xhalf_cat) "right"]
                    [else (wstate-d stat)])))

; wstate -> Image
; Renders images of cat and happiness gauge based on
; data from wstate
(check-expect (render (make-wstate 50 10 "right"))
              (place-images
               (list cat
                     hgauge)
               (list (make-posn 10 cat_ypos)
                     (make-posn 50 hgauge_ypos))
               bg))
(define (render stat)
  (place-images
   (list cat
         hgauge)
   (list (make-posn (wstate-x stat) cat_ypos)
         (make-posn (wstate-h stat) hgauge_ypos))
   bg))

; String wstate -> number
; Determines the proper amount to increment happiness gauge with
; so that it doesn't exceed the max value (the center point
; of the happiness gauge will not go past the center point of
; the scene)
(check-expect (increment  "down" (make-wstate hgauge_maxpos 50 "right"))
              hgauge_maxpos)
(define (increment ke stat)
  (if (or (>= (+ (wstate-h stat) (/ scn_width 5))
              hgauge_maxpos)    
          (>= (+ (wstate-h stat) (/ scn_width 3))
              hgauge_maxpos))
      hgauge_maxpos
      (if (key=? ke "up")
          (+ (wstate-h stat) (/ scn_width 5))
          (+ (wstate-h stat) (/ scn_width 3)))))

; wstate String -> wstate
; Keystroke "up" (petting): increase happiness gauge by 1/5
; Keystroke "down" (feeding): increase happiness gauge by 1/3
; Happiness gauge shouldn't exceed the max limit when these
; actions are taken
(check-expect (change_mood (make-wstate hgauge_maxpos xhalf_cat "right") "up")
              (make-wstate hgauge_maxpos xhalf_cat "right"))
(define (change_mood stat ke)
  (cond[(>= (wstate-h stat) hgauge_maxpos) stat]
       [else (cond[(key=? ke "up") (make-wstate
                                    (increment ke stat)
                                    (wstate-x stat)
                                    (wstate-d stat))]
                  [(key=? ke "down") (make-wstate
                                      (increment ke stat)
                                      (wstate-x stat)
                                      (wstate-d stat))]
                  [else stat])]))

; wstate -> wstate
(define (main curr_state)
  (big-bang curr_state
    [to-draw render]
    [on-tick time_step]
    [on-key change_mood]))

; tester
(main (make-wstate hgauge_maxpos xhalf_cat "right"))
