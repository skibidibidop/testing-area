;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cat_cham) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 2, 2023

Simulates a cat or chameleon pet based on initial input.
Pets change their movement direction upon reaching
the border.
Certain key strokes can change the chosen pet's mood.
|#

(require 2htdp/image)
(require 2htdp/universe)

; IMAGES ///////////////////////////////////////////////////

(define SCALER 10)

(define SWIDTH (* SCALER 20))
(define SHEIGHT (* SCALER 10))

(define CAT (circle (* SCALER 5) "solid" "brown"))
(define CAT_YPOS (- SHEIGHT
                    (/ (image-height CAT) 2)))
(define CAT_XHALF (/ (image-width CAT) 2))

(define CHAMELEON
  (rectangle (* SCALER 6) (* SCALER 3) "solid" "red"))
(define CHAMELEON_YPOS (- SHEIGHT
                          (/ (image-height CHAMELEON) 2)))
(define CHAMELEON_XHALF (/ (image-width CAT) 2))

(define HGAUGE (rectangle SWIDTH SHEIGHT "solid" "red"))
(define HGAUGE_YPOS (/ (image-height HGAUGE) 2))
(define HGAUGE_FULL (/ SWIDTH 2))
(define HGUAGE_EMPTY (- 1 (/ SWIDTH 2)))
(define HGAUGE_DOWN 0.1)

(define PET_HGUP 5)
(define FEED_HGUP 10)

(define RIGHT_SPD 3)
(define LEFT_SPD -3)

(define BG (empty-scene SWIDTH SHEIGHT))

; DATA DEFINITIONS /////////////////////////////////////////

(define-struct vcat [hpos xpos vel])
; vcat: (make-vcat Number Number Number)
; Interp.:
; (make-vcat hpos xpos vel), a cat with the following:
; hpos: center (x-coordinate) of the cat's happiness gauge.
;     : Gauge is full if this is at HGAUGE_FULL.
;     : Gauge is empty if this is at HGAUGE_EMPTY.
; xpos: x-coordinate of CAT
; vel: velocity (RIGHT_SPD or LEFT_SPD) of CAT
; (define vcat1 (make-vcat 30 40 RIGHT_SPD))
#;
(define (fn_for_vcat c)
  (...(vcat-hpos c) (vcat-xpos c) (vcat-vel c)))

(define-struct vcham [hpos xpos vel])
; vcham: (make-vcham Number Number Number)
; Interp.:
; (make-vcham hpos xpos vel), a chameleon w/ the following:
; hpos: center (x-coordinate) of the chameleon's happiness
;     : gauge. Gauge is full if it is at HGAUGE_FULL, and
;     : it is empty if at HGAUGE_EMPTY.
; xpos: x-coordinate of CHAMELEON.
; vel: velocity (RIGHT_SPD or LEFT_SPD) of CHAMELEON
; (define vcham1 (make-vcham 40 50 LEFT_SPD))
#;
(define (fn_for_vcham ch)
  (...(vcham-hpos ch) (vcham-xpos ch) (vcham-vel ch)))

; A vanimal is either:
; -- a vcat
; -- a vcham
; Interp.:
;   vcat  - happiness gauge, x-coord, velocity of CAT
;   vcham - happiness gauge, x-coord, velocity of CHAMELEON
; (define VA1 (make-vcat 20 50 RIGHT_SPD))
; (define VA2 (make-vcham 30 40 LEFT_SPD))
#;
(define (fn_for_vanimal va)
  (cond[(vcat? va) (...)]
       [(vcham? va) (...)]
       [else (...)]))

; FUNCTION DEFINITIONS /////////////////////////////////////

; vanimal -> Image
; Renders CAT/CHAMELEON, HGAUGE, BG based on vanimal data
(check-expect (render (make-vcat 30 40 RIGHT_SPD))
              (place-images
               (list HGAUGE CAT)
               (list (make-posn 30 HGAUGE_YPOS)
                     (make-posn 40 CAT_YPOS))
               BG))
(check-expect (render (make-vcham 50 60 LEFT_SPD))
              (place-images
               (list HGAUGE CHAMELEON)
               (list (make-posn 50 HGAUGE_YPOS)
                     (make-posn 60 CAT_YPOS))
               BG))

(define (render va)
  (cond[(vcat? va)
        (place-images
         (list HGAUGE CAT)
         (list (make-posn (vcat-hpos va) HGAUGE_YPOS)
               (make-posn (vcat-xpos va) CAT_YPOS))
         BG)]
       [else
        (place-images
         (list HGAUGE CHAMELEON)
         (list (make-posn (vcham-hpos va) HGAUGE_YPOS)
               (make-posn (vcham-xpos va) CAT_YPOS))
         BG)]))

; Number -> Number
; Changes direction of movement if a border is reached
(check-expect (turn
               (make-vcat
                50 (- SWIDTH CAT_XHALF) RIGHT_SPD))
              LEFT_SPD)
(check-expect (turn
               (make-vcat 50 CAT_XHALF LEFT_SPD))
              RIGHT_SPD)
(check-expect (turn
               (make-vcham
                50 (- SWIDTH CHAMELEON_XHALF) RIGHT_SPD))
              LEFT_SPD)
(check-expect (turn
               (make-vcham 50 CHAMELEON_XHALF LEFT_SPD))
               RIGHT_SPD)

(define (turn va)
  (cond
    [(vcat? va)
     (cond
       [(>= (vcat-xpos va) (- SWIDTH CAT_XHALF))
        LEFT_SPD]
       [(<= (vcat-xpos va) CAT_XHALF)
        RIGHT_SPD]
       [else (vcat-vel va)])]
    [(vcham? va)
     (cond
       [(>= (vcham-xpos va) (- SWIDTH CHAMELEON_XHALF))
        LEFT_SPD]
       [(<= (vcham-xpos va) CHAMELEON_XHALF)
        RIGHT_SPD]
       [else (vcham-vel va)])]
    [else va]))

; vanimal -> vanimal
; Updates vcat/vcham per tick
(check-expect (time_step (make-vcat 40 50 RIGHT_SPD))
              (make-vcat (- 40 HGAUGE_DOWN)
                         (+ 50 RIGHT_SPD)
                         RIGHT_SPD))
(check-expect (time_step (make-vcat 60 70 LEFT_SPD))
              (make-vcat (- 60 HGAUGE_DOWN)
                         (+ 70 LEFT_SPD)
                         LEFT_SPD))
(check-expect (time_step (make-vcham 20 30 RIGHT_SPD))
              (make-vcham (- 20 HGAUGE_DOWN)
                          (+ 30 RIGHT_SPD)
                          RIGHT_SPD))
(check-expect (time_step (make-vcham 10 20 LEFT_SPD))
              (make-vcham (- 10 HGAUGE_DOWN)
                          (+ 20 LEFT_SPD)
                          RIGHT_SPD))

(define (time_step va)
  (cond
    [(vcat? va)
     (make-vcat (- (vcat-hpos va) HGAUGE_DOWN)
                (+ (vcat-xpos va) (vcat-vel va))
                (turn va))]
    [else
     (make-vcham (- (vcham-hpos va) HGAUGE_DOWN)
                 (+ (vcham-xpos va) (vcham-vel va))
                 (turn va))]))

; vanimal ke -> vanimal
; Increase happiness (cat, chameleon) and
; change color (chameleon only)
(check-expect (change_mood
               (make-vcat 10 20 RIGHT_SPD) "right")
              (make-vcat 10 20 RIGHT_SPD))
(check-expect (change_mood
               (make-vcat 20 30 RIGHT_SPD) "left")
              (make-vcat 20 30 LEFT_SPD))
(check-expect (change_mood
               (make-vcat 20 30 LEFT_SPD) "right")
              (make-vcat 20 30 RIGHT_SPD))
(check-expect (change_mood
               (make-vcat 20 30 LEFT_SPD) "left")
              (make-vcat 20 30 LEFT_SPD))
(check-expect (change_mood
               (make-vcat 30 40 RIGHT_SPD) "up")
              (make-vcat (+ 30 PET_HGUP) 40 RIGHT_SPD))
(check-expect (change_mood
               (make-vcat 40 50 RIGHT_SPD) "down")
              (make-vcat (+ 40 FEED_HGUP) 50 RIGHT_SPD))
(check-expect (change_mood
               (make-vcham 10 20 RIGHT_SPD) "right")
              (make-vcham 10 20 RIGHT_SPD))
(check-expect (change_mood
               (make-vcham 10 20 RIGHT_SPD) "left")
              (make-vcham 10 20 LEFT_SPD))
(check-expect (change_mood
               (make-vcham 10 20 LEFT_SPD) "right")
              (make-cham 10 20 RIGHT_SPD))
(check-expect (change_mood
               (make-vcham 10 20 LEFT_SPD) "left")
              (make-vcham 10 20 LEFT_SPD))
(check-expect (change_mood
               (make-vcham 10 20 RIGHT_SPD) "up")
              (make-vcham 10 20 RIGHT_SPD))
(check-expect (change_mood
               (make-vcham 10 20 RIGHT_SPD) "down")
              (make-vcham (+ 10 FEED_HGUP) 20 RIGHT_SPD))
(check-expect (change_mood
               (make-vcham 10 20 RIGHT_SPD) "r" ; REFACTOR TO INCLUDE COLOR IN VCHAM

#|
(define (main init)
  (big-bang init
    [to-draw render]
    [on-tick time_step]
    [on-key change_mood]
    [stop-when stop]))
|#