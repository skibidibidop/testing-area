#|
Author: Mark Beltran
Date: August 2, 2023

Exercise 157. Experiment to determine whether the arbitrary decisions
concerning constants are easy to change. For example, determine whether
changing a single constant definition achieves the desired outcome:

• change the height of the canvas to 220 pixels;
• change the width of the canvas to 30 pixels;
• change the x location of the line of shots to “somewhere to the left of
the middle”;
• change the background to a green rectangle; and
• change the rendering of shots to a red elongated rectangle.

Also check whether it is possible to double the size of the shot without
changing anything else or to change its color to black.
|#

; The properties are easy enough to change, but it might be better
; if there is a single point of control to change all sizes to scale

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
(check-expect (tock '()) '())
(check-expect (tock (list 70 60 50)) (list 69 59 49))

(define (tock w)
  (cond
    [(empty? w) '()]
    [else (cons (sub1 (first w)) (tock (rest w)))]))

; ShotWorld KeyEvent -> ShotWorld
; adds a shot to the world if the space bar is hit
(check-expect (keyh '() " ") (list HEIGHT))
(check-expect (keyh (list 50) " ") (list HEIGHT 50))
(check-expect (keyh (list 50) "a") (list 50))

(define (keyh w ke)
  (if (key=? ke " ") (cons HEIGHT w) w))

; ShotWorld -> Image
; adds each shot y on w at (XSHOTS,y} to BACKGROUND
(check-expect (to-image '()) BACKGROUND)
(check-expect (to-image (list 50))
              (place-image SHOT XSHOTS 50 BACKGROUND))
(check-expect (to-image (list 60 50))
              (place-image
               SHOT XSHOTS 60
               (place-image
                SHOT XSHOTS 50 BACKGROUND)))

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

(main '())
