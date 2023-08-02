#|
Author: Mark Beltran
Date: August 2, 2023

Exercise 156. Equip the program in figure 61 with tests and make sure
it passes those. Explain what main does. Then run the program via main.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define HEIGHT 80) ; distances in terms of pixels
(define WIDTH 100)
(define XSHOTS (/ WIDTH 2))

; graphical constants
(define BACKGROUND (empty-scene WIDTH HEIGHT))
(define SHOT (triangle 3 "solid" "red"))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A List-of-shots is one of:
; -- '()
; -- (cons Shot List-of-shots)
; interpretation the collection of shots fired

; A Shot is a Number.
; interpretation represents the shot's y-coordinate

; A ShotWorld is List-of-numbers.
; interpretation each number on such a list
; represents the y-coordinate of a shot


; FUNCTIONS ////////////////////////////////////////////////////////////////////

; ShotWorld -> ShotWorld
; moves each shot up by one pixel
(define (tock w)
  (cond
    [(empty? w) '()]
    [else (cons (sub1 (first w)) (tock (rest w)))]))

; ShotWorld KeyEvent -> ShotWorld
; adds a shot to the world if the space bar is hit
(define (keyh w ke)
  (if (key=? ke " ") (cons HEIGHT w) w))

; ShotWorld -> Image
; adds each shot y on w at (XSHOTS,y} to BACKGROUND
(define (to-image w)
  (cond
    [(empty? w) BACKGROUND]
    [else (place-image SHOT XSHOTS (first w)
                       (to-image (rest w)))]))

; MAIN /////////////////////////////////////////////////////////////////////////

; ShotWorld -> ShotWorld
(define (main w0)
  (big-bang w0
    [on-tick tock]
    [on-key keyh]
    [to-draw to-image]))
