;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_90) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 23, 2023

Exercise 89. Design the happy-cat world program, which manages
a walking cat and its happiness level. Let’s assume that the cat starts out
with perfect happiness.

Hints (1) Reuse the functions from the world programs in chapter 3.7.
(2) Use structure type from the preceding exercise to represent the state of
the world.
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

(define SAD_RATE (* SCALER 0.5))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct vcat [x h])
; (make-vcat Number Happiness)
; Interp.: (make-vcat 30 50) represents the cat's x-coordinate and happiness

; A Happiness is a Number
; Interp.: represents the distance in pixels between the left border and the
; center of the HGAUGE

; A Valid_key is one of:
; "up"
; "down"
; Interp.:
; "up" to pet the cat, increases its happiness by HAP_UP_SML
; "down" to feed the cat, increases its happiness by HAP_UP_BIG

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; VCat -> Image
; Renders an Image based on data from VCat vc
(check-expect (render (make-vcat 30 MAX_HAP))
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
(check-expect (time_step (make-vcat 30 MAX_HAP))
              (make-vcat (+ 30 MOVE_SPEED) (- MAX_HAP SAD_RATE)))
(check-expect (time_step (make-vcat CAT_MAX_XPOS MAX_HAP))
              (make-vcat CAT_START_XPOS (- MAX_HAP SAD_RATE)))

(define (time_step vc)
  (cond
    [(>= (vcat-x vc) CAT_MAX_XPOS)
     (make-vcat CAT_START_XPOS (- (vcat-h vc) SAD_RATE))]
    [else
     (make-vcat (+ (vcat-x vc) MOVE_SPEED)
               (- (vcat-h vc) SAD_RATE))]))

; VCat Valid_key -> VCat
; Increases the cat's happiness based on the key pressed
(check-expect (change_mood (make-vcat CAT_MAX_XPOS MAX_HAP) "up")
              (make-vcat CAT_MAX_XPOS MAX_HAP))
(check-expect (change_mood (make-vcat CAT_MAX_XPOS MAX_HAP) "down")
              (make-vcat CAT_MAX_XPOS MAX_HAP))
(check-expect (change_mood (make-vcat CAT_MAX_XPOS MAX_HAP) "left")
              (make-vcat CAT_MAX_XPOS MAX_HAP))
(check-expect (change_mood (make-vcat CAT_MAX_XPOS (+ MIN_HAP 1)) "up")
              (make-vcat CAT_MAX_XPOS (+ (+ MIN_HAP 1) HAP_UP_SML)))
(check-expect (change_mood (make-vcat CAT_MAX_XPOS (+ MIN_HAP 1)) "down")
              (make-vcat CAT_MAX_XPOS (+ (+ MIN_HAP 1) HAP_UP_BIG)))
(check-expect (change_mood (make-vcat CAT_MAX_XPOS (+ MIN_HAP 1)) "right")
              (make-vcat CAT_MAX_XPOS (+ MIN_HAP 1)))
(check-expect (change_mood (make-vcat CAT_MAX_XPOS (- MAX_HAP 1)) "up")
              (make-vcat CAT_MAX_XPOS MAX_HAP))
(check-expect (change_mood (make-vcat CAT_MAX_XPOS (- MAX_HAP 1)) "down")
              (make-vcat CAT_MAX_XPOS MAX_HAP))
(check-expect (change_mood (make-vcat CAT_MAX_XPOS (- MAX_HAP 1)) "a")
              (make-vcat CAT_MAX_XPOS (- MAX_HAP 1)))

(define (change_mood vc vk)
  (cond
    [(and (or (key=? vk "up")
              (key=? vk "down"))
          (or (>= (+ (vcat-h vc) HAP_UP_SML) MAX_HAP)
              (>= (+ (vcat-h vc) HAP_UP_BIG) MAX_HAP)))
     (make-vcat (vcat-x vc) MAX_HAP)]
    [else
     (make-vcat (vcat-x vc)
                (cond
                  [(key=? vk "up")
                   (+ (vcat-h vc) HAP_UP_SML)]
                  [(key=? vk "down")
                   (+ (vcat-h vc) HAP_UP_BIG)]
                  [else (vcat-h vc)]))]))

; VCat -> Boolean
; Returns #true if happiness is depleted


(define (sad? vc) #false)

; MAIN /////////////////////////////////////////////////////////////////////////

(define (happy_cat state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]
    [on-key change_mood]
    [stop-when sad?]))

(happy_cat (make-vcat CAT_START_XPOS MAX_HAP))