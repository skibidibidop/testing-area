;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_92) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 24, 2023

Exercise 92. Design the cham program, which has the chameleon con-
tinuously walking across the canvas from left to right. When it reaches the
right end of the canvas, it disappears and immediately reappears on the
left. Like the cat, the chameleon gets hungry from all the walking, and, as
time passes by, this hunger expresses itself as unhappiness.

For managing the chameleon’s happiness gauge, you may reuse the
happiness gauge from the virtual cat. To make the chameleon happy, you
feed it (down arrow, two points only); petting isn’t allowed. Of course, like
all chameleons, ours can change color, too: "r" turns it red, "b" blue, and
"g" green. Add the chameleon world program to the virtual cat game and
reuse functions from the latter when possible.

Start with a data definition, VCham, for representing chameleons.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 1) ; single point of control

(define SCN_WIDTH (* SCALER 250))
(define SCN_HEIGHT (* SCALER 100))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define GAUGE_HEIGHT (* SCALER 10))
(define HGAUGE_YCENTER (/ GAUGE_HEIGHT 2))
(define HGAUGE_YPOS HGAUGE_YCENTER)
(define HGAUGE (rectangle SCN_WIDTH GAUGE_HEIGHT "solid" "red"))
(define MAX_HAP SCN_XCENTER)
(define MIN_HAP (- 0 SCN_XCENTER))
(define HAP_UP (* SCALER 2))

(define CHAM (rectangle (* SCALER 50) (* SCALER 20) "outline" "green"))
(define CHAM_YPOS (- SCN_HEIGHT
                     (/ (image-height CHAM) 2)))
(define CHAM_MAX_XPOS (- SCN_WIDTH
                         (/ (image-width CHAM) 2)))
(define CHAM_START_XPOS (image-width CHAM))

(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

(define SAD_RATE (* SCALER 1))

(define MOVE_SPEED (* SCALER 3))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct vcham [x h c])
; (make-vcham  Number Happiness Color)
; Interp.: (make-vcham pos hap col) represents the chameleon's
; x-coordinate (pos), happiness level (hap), and color (col)

; A Happiness is a Number
; Interp.: the distance in pixels between the center of HGAUGE and
; the left border

; A Color is one of:
; "red"
; "blue"
; "green"
; Interp.: all possible colors of the chameleon

; A Valid_key is one of:
; "r"
; "g"
; "b"
; "down"
; Interp.:
; "r" changes the chameleon's color to red
; "g" changes the chameleon's color to green
; "b" changes the chameleon's color to blue
; "down" increases the chameleon's happiness by HAP_UP

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; VCham -> Image
; Renders an image based on data in VCham vc
(check-expect (render (make-vcham 30 MAX_HAP "green"))
              (place-images
               (list CHAM HGAUGE)
               (list (make-posn 30 CHAM_YPOS)
                     (make-posn MAX_HAP HGAUGE_YPOS))
               BG))

(define (render vc)
  (place-images
   (list CHAM HGAUGE)
   (list (make-posn (vcham-x vc) CHAM_YPOS)
         (make-posn (vcham-h vc) HGAUGE_YPOS))
   BG))

; VCham -> VCham
; Updates VCham vc per tick
(check-expect (time_step (make-vcham 30 MAX_HAP "red"))
              (make-vcham (+ 30 MOVE_SPEED) (- MAX_HAP SAD_RATE) "red"))
(check-expect (time_step (make-vcham CHAM_MAX_XPOS MAX_HAP "red"))
              (make-vcham CHAM_START_POS (- MAX_HAP SAD_RATE) "red"))
(check-expect (time_step (make-vcham CHAM_MAX_XPOS MIN_HAP "green"))
              (make-vcham CHAM_START_POS MIN_HAP "green"))

(define (time_step vc)
  (

;
;
(define (change_mood vc vk) vc)

; MAIN /////////////////////////////////////////////////////////////////////////

(define (cham state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]
    [on-key change_mood]))