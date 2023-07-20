#|
Author: Mark Beltran
Date: July 21, 2023

Sample Problem Another colleague is tasked to design resetdot,
a function that resets the dot when the mouse is clicked.

Exercise 74. Copy all relevant constant and function definitions to DrRacket’s
definitions area. Add the tests and make sure they pass. Then run the program
and use the mouse to place the red dot.
|#

(require 2htdp/universe)
(require 2htdp/image)

(define MTS (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Posn represents the state of the world.

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Posn -> Image
; adds a red spot to MTS at p
(check-expect (scene+dot (make-posn 10 20))
              (place-image DOT 10 20 MTS))
(check-expect (scene+dot (make-posn 88 73))
              (place-image DOT 88 73 MTS))

(define (scene+dot p)
  (place-image DOT (posn-x p) (posn-y p) MTS))

; Posn -> Posn
; increases the x-coordinate of p by 3
(check-expect (x+ (make-posn 10 0)) (make-posn 13 0))

(define (x+ p)
  (make-posn (+ (posn-x p) 3) (posn-y p)))

; Posn Number Number MouseEvt -> Posn
; for mouse clicks, (make-posn x y); otherwise p
(check-expect
 (reset-dot (make-posn 10 20) 29 31 "button-down")
 (make-posn 29 31))
(check-expect
 (reset-dot (make-posn 10 20) 29 31 "button-up")
 (make-posn 10 20))

(define (reset-dot p x y me)
  (cond
    [(mouse=? me "button-down") (make-posn x y)]
    [else p]))

; MAIN /////////////////////////////////////////////////////////////////////////

; Posn -> Posn
(define (main p0)
  (big-bang p0
    [on-tick x+ 0.1]
    [on-mouse reset-dot]
    [to-draw scene+dot]))

(main (make-posn 0 0))
