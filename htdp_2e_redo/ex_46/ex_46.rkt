;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_46) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 46. Improve the cat animation with a slightly different image.
Adjust the rendering function from exercise 45 so that it uses one cat image
or the other based on whether the x-coordinate is odd. Read up on odd? in
the HelpDesk, and use a cond expression to select cat images.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)
(define SCN_WIDTH (* SCALER 50))
(define SCN_HEIGHT (* SCALER 20))
(define XCENTER (/ SCN_WIDTH 2))
(define YCENTER (/ SCN_WIDTH 2))

(define CAT (circle (* SCALER 2) "outline" "black"))
(define CAT2 (circle (* SCALER 2) "solid" "black"))
(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

(define CAT_YPOS (- SCN_HEIGHT
                    (/ (image-height CAT) 2)))

(define MOVE_SPEED 3) ; Pixels per tick

(define OUT_OF_BOUNDS (+ SCN_WIDTH
                         (/ (image-width CAT) 2)))
(define STARTING_POS (/ (image-width CAT) 2))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct catpos [x y])
; (make-catpos Number Number)
; Interp.: (make-catpos xpos ypos), represents CAT's
; x (xpos), y (ypos) coordinates

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Catpos -> Image
; Draws CAT on BG with its position based on cpos
(check-expect (render (make-catpos 30 90))
              (place-image CAT 30 90 BG))

(define (render cpos)
  (place-image CAT
               (catpos-x cpos)
               (catpos-y cpos)
               BG))

; Catpos -> Catpos
; Updates the position of CAT per tick
(check-expect (time_step (make-catpos 30 90))
              (make-catpos 33 90))

(define (time_step cpos)
  (make-catpos
   (cond
     [(>= (catpos-x cpos) OUT_OF_BOUNDS)
      STARTING_POS]
     [else
      (+ (catpos-x cpos) MOVE_SPEED)])
     (catpos-y cpos)))

; Catpos -> Catpos
(define (main state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]))

(main (make-catpos 0 CAT_YPOS))
