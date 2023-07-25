;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_91) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 23, 2023

Exercise 91. Extend your structure type definition and data definition
from exercise 88 to include a direction field. Adjust your happy-cat pro-
gram so that the cat moves in the specified direction. The program should
move the cat in the current direction, and it should turn the cat around
when it reaches either end of the scene.
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
(define HAP_UP_SML (/ SCN_WIDTH 5))
(define HAP_UP_BIG (/ SCN_WIDTH 3))

(define CAT (circle (* SCALER 20) "solid" "brown"))
(define CAT_SIZE (image-width CAT))
(define CAT_RAD (/ CAT_SIZE 2))
(define CAT_YPOS (- SCN_HEIGHT CAT_RAD))
(define CAT_START_XPOS CAT_RAD)
(define CAT_MAX_XPOS (- SCN_WIDTH CAT_RAD))

(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

(define MOVE_SPEED (* SCALER 3))
(define MOVE_L (* MOVE_SPEED -1))
(define MOVE_R MOVE_SPEED)

(define SAD_RATE (* SCALER 1))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct vcat [x h d])
; (make-vcat Number Happiness Direction)
; Interp.: (make-vcat 30 50 "left") represents the cat's x-coordinate
; happiness, and movement direction

; A Happiness is a Number
; Interp.: represents the distance in pixels between the left border and the
; center of the HGAUGE

; A Direction is one of:
; "left"
; "right"

; A Valid_key is one of:
; "up"
; "down"
; Interp.:
; "up" to pet the cat, increases its happiness by HAP_UP_SML
; "down" to feed the cat, increases its happiness by HAP_UP_BIG

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; VCat -> Image
; Renders an Image based on data from VCat vc
(check-expect (render (make-vcat 30 MAX_HAP MOVE_R))
              (place-images
               (list CAT HGAUGE)
               (list (make-posn 30 CAT_YPOS)
                     (make-posn MAX_HAP HGAUGE_YPOS))
               BG))

(define (render vc)
  (place-images
   (list CAT HGAUGE)
   (list (make-posn (vcat-x vc) CAT_YPOS)
         (make-posn (vcat-h vc) HGAUGE_YPOS))
   BG))

; VCat -> VCat
; Updates VCat vc per tick
(check-expect (time_step (make-vcat 30 MAX_HAP MOVE_L))
              (make-vcat (+ 30 MOVE_L) (- MAX_HAP SAD_RATE) MOVE_L))
(check-expect (time_step (make-vcat CAT_MAX_XPOS MAX_HAP MOVE_R))
              (make-vcat (- CAT_MAX_XPOS MOVE_SPEED)
                         (- MAX_HAP SAD_RATE)
                         MOVE_L))

(define (time_step vc)
  (cond
    [(>= (vcat-x vc) CAT_MAX_XPOS)
     (make-vcat (- CAT_MAX_XPOS MOVE_SPEED)
                (- (vcat-h vc) SAD_RATE)
                MOVE_L)]
    [(<= (vcat-x vc) CAT_START_XPOS)
     (make-vcat (+ CAT_START_XPOS MOVE_SPEED)
                (- (vcat-h vc) SAD_RATE)
                MOVE_R)]
    [else
     (make-vcat (+ (vcat-x vc) (vcat-d vc))
               (- (vcat-h vc) SAD_RATE)
               (vcat-d vc))]))

; VCat Valid_key -> VCat
; Updates VCat based on key pressed
(check-expect (change_mood (make-vcat CAT_MAX_XPOS MAX_HAP MOVE_R) "up")
              (make-vcat CAT_MAX_XPOS MAX_HAP MOVE_R))
(check-expect (change_mood (make-vcat CAT_MAX_XPOS MAX_HAP MOVE_R) "down")
              (make-vcat CAT_MAX_XPOS MAX_HAP MOVE_R))
(check-expect (change_mood (make-vcat CAT_MAX_XPOS MAX_HAP MOVE_R) "left")
              (make-vcat CAT_MAX_XPOS MAX_HAP MOVE_L))
(check-expect (change_mood
               (make-vcat CAT_MAX_XPOS (+ MIN_HAP 1) MOVE_R) "up")
              (make-vcat CAT_MAX_XPOS (+ (+ MIN_HAP 1) HAP_UP_SML) MOVE_R))
(check-expect (change_mood
               (make-vcat CAT_MAX_XPOS (+ MIN_HAP 1) MOVE_L) "down")
              (make-vcat CAT_MAX_XPOS (+ (+ MIN_HAP 1) HAP_UP_BIG) MOVE_L))
(check-expect (change_mood
               (make-vcat CAT_MAX_XPOS (+ MIN_HAP 1) MOVE_R) "right")
              (make-vcat CAT_MAX_XPOS (+ MIN_HAP 1) MOVE_R))
(check-expect (change_mood
               (make-vcat CAT_MAX_XPOS (- MAX_HAP 1) MOVE_R) "up")
              (make-vcat CAT_MAX_XPOS MAX_HAP MOVE_R))
(check-expect (change_mood
               (make-vcat CAT_MAX_XPOS (- MAX_HAP 1) MOVE_L) "down")
              (make-vcat CAT_MAX_XPOS MAX_HAP MOVE_L))
(check-expect (change_mood
               (make-vcat CAT_MAX_XPOS (- MAX_HAP 1) MOVE_L) "a")
              (make-vcat CAT_MAX_XPOS (- MAX_HAP 1) MOVE_L))

(define (change_mood vc vk)
  (cond
    [(key=? vk "left")
     (make-vcat (vcat-x vc) (vcat-h vc) MOVE_L)]
    [(key=? vk "right")
     (make-vcat (vcat-x vc) (vcat-h vc) MOVE_R)]
    [(and (or (key=? vk "up")
              (key=? vk "down"))
          (or (>= (+ (vcat-h vc) HAP_UP_SML) MAX_HAP)
              (>= (+ (vcat-h vc) HAP_UP_BIG) MAX_HAP)))
     (make-vcat (vcat-x vc) MAX_HAP (vcat-d vc))]
    [else
     (make-vcat (vcat-x vc)
                (cond
                  [(key=? vk "up")
                   (+ (vcat-h vc) HAP_UP_SML)]
                  [(key=? vk "down")
                   (+ (vcat-h vc) HAP_UP_BIG)]
                  [else (vcat-h vc)])
                (vcat-d vc))]))

; VCat -> Boolean
; Returns #true if happiness is depleted
(check-expect (sad? (make-vcat 30 MAX_HAP MOVE_L)) #false)
(check-expect (sad? (make-vcat 30 MIN_HAP MOVE_R)) #true)
(check-expect (sad? (make-vcat 30 (+ MIN_HAP 1) MOVE_L)) #false)
(check-expect (sad? (make-vcat 30 (- MAX_HAP 1) MOVE_R)) #false)

(define (sad? vc)
  (<= (vcat-h vc) MIN_HAP))

; MAIN /////////////////////////////////////////////////////////////////////////

(define (happy_cat state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]
    [on-key change_mood]
    [stop-when sad?]))

(happy_cat (make-vcat CAT_START_XPOS MAX_HAP MOVE_R))