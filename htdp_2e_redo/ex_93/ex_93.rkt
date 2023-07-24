;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_93) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 24, 2023

Exercise 93. Copy your solution to exercise 92 and modify the copy so
that the chameleon walks across a tricolor background. Our solution uses
these colors:

(define BACKGROUND
(beside (empty-scene WIDTH HEIGHT "green")
(empty-scene WIDTH HEIGHT "white")
(empty-scene WIDTH HEIGHT "red")))

but you may use any colors. Observe how the chameleon changes colors to
blend in as it crosses the border between two colors.
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
(define CHAM_START_XPOS (/ (image-width CHAM) 2))


(define COLOR_BOX_WIDTH (/ SCN_WIDTH 3))
(define BG
  (beside (empty-scene COLOR_BOX_WIDTH SCN_HEIGHT "green")
          (empty-scene COLOR_BOX_WIDTH SCN_HEIGHT "blue")
          (empty-scene COLOR_BOX_WIDTH SCN_HEIGHT "purple")))

(define SAD_RATE (* SCALER 0.1))

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
   (list (rectangle (* SCALER 50) (* SCALER 20) "outline" (vcham-c vc))
         HGAUGE)
   (list (make-posn (vcham-x vc) CHAM_YPOS)
         (make-posn (vcham-h vc) HGAUGE_YPOS))
   BG))

; VCham -> VCham
; Updates VCham vc per tick
(check-expect (time_step (make-vcham 30 MAX_HAP "red"))
              (make-vcham (+ 30 MOVE_SPEED) (- MAX_HAP SAD_RATE) "red"))
(check-expect (time_step (make-vcham CHAM_MAX_XPOS MAX_HAP "red"))
              (make-vcham CHAM_START_XPOS (- MAX_HAP SAD_RATE) "red"))
(check-expect (time_step (make-vcham CHAM_MAX_XPOS MIN_HAP "green"))
              (make-vcham CHAM_START_XPOS MIN_HAP "green"))

(define (time_step vc)
  (make-vcham (cond
                [(>= (vcham-x vc) CHAM_MAX_XPOS) CHAM_START_XPOS]
                [else (+ (vcham-x vc) MOVE_SPEED)])
              (cond
                [(<= (vcham-h vc) MIN_HAP) MIN_HAP]
                [else (- (vcham-h vc) SAD_RATE)])
              (vcham-c vc)))
; VCham Valid_key -> VCham
; Changes the chameleon's color or happiness level
; depending on Valid_key vk
(check-expect (change_mood (make-vcham 30 MAX_HAP "red") "r")
              (make-vcham 30 MAX_HAP "red"))
(check-expect (change_mood (make-vcham 30 MAX_HAP "red") "g")
              (make-vcham 30 MAX_HAP "green"))
(check-expect (change_mood (make-vcham 30 MAX_HAP "red") "b")
              (make-vcham 30 MAX_HAP "blue"))
(check-expect (change_mood (make-vcham 30 MAX_HAP "red") "down")
              (make-vcham 30 MAX_HAP "red"))
(check-expect (change_mood (make-vcham 30 MIN_HAP "red") "down")
              (make-vcham 30 (+ MIN_HAP HAP_UP) "red"))

(define (change_mood vc vk)
  (make-vcham (vcham-x vc)
              (cond
                [(and (key=? vk "down")
                      (>= (+ (vcham-h vc) HAP_UP) MAX_HAP))
                 MAX_HAP]
                [(and (key=? vk "down")
                      (< (+ (vcham-h vc) HAP_UP) MAX_HAP))
                 (+ (vcham-h vc) HAP_UP)]
                [else (vcham-h vc)])
              (cond
                [(key=? vk "r") "red"]
                [(key=? vk "g") "green"]
                [(key=? vk "b") "blue"]
                [else (vcham-c vc)])))

; MAIN /////////////////////////////////////////////////////////////////////////

; VCham -> VCham
(define (cham state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]
    [on-key change_mood]))

(cham (make-vcham CHAM_START_XPOS MAX_HAP "red"))