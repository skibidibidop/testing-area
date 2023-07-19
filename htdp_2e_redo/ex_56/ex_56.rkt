#|
Author: Mark Beltran
Date: July 20, 2023

Sample Problem
Design a program that launches a rocket when
the user presses the space bar. At that point, the simulation
starts a countdown for three ticks, before it displays the scenery
of a rising rocket. The rocket should move upward at a rate of
three pixels per clock tick.

Exercise 56. Define main2 so that you can launch the rocket and watch
it lift off. Read up on the on-tick clause to determine the length of one
tick and how to change it.
If you watch the entire launch, you will notice that once the rocket
reaches the top something curious happens. Explain. Add a stop-when
clause to main2 so that the simulation of the liftoff stops gracefully when
the rocket is out of sight.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define HEIGHT 300)
(define WIDTH 100)
(define YDELTA 3)
(define BACKG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
(define CENTER (/ (image-height ROCKET) 2))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An LRCD (for launching rocket countdown) is one of:
; -- "resting"
; -- a Number between -3 and -1
; -- a NonnegativeNumber
; interpretation a grounded rocket, in countdown mode,
; a number denotes the number of pixels between the
; top of the canvas and the rocket (its height)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; LRCD -> Image
; renders the state as a resting or flying rocket
(check-expect (show "resting")
              (place-image ROCKET 10 HEIGHT BACKG))
(check-expect (show -2)
              (place-image (text "-2" 20 "red")
                           10 (* 3/4 WIDTH)
                           (place-image ROCKET 10 HEIGHT BACKG)))
(check-expect (show 53)
              (place-image ROCKET 10 53 BACKG))

(define (show x)
  (cond
    [(string? x)
     (show_aux HEIGHT)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (
                      * 3/4 WIDTH)
                  (show_aux HEIGHT))]
    [(>= x 0)
     (show_aux 10)]))

; Number -> Image
; Draws ROCKET on BACKG, with its x-coordinate based on pos
(define (show_aux pos)
  (place-image ROCKET
               10 (- pos CENTER)
               BACKG))

; LRCD KeyEvent -> LRCD
; starts the countdown when space bar is pressed,
; if the rocket is still resting
(check-expect (launch "resting" " ") -3)
(check-expect (launch "resting" "a") "resting")
(check-expect (launch -3 " ") -3)
(check-expect (launch -1 " ") -1)
(check-expect (launch 33 " ") 33)
(check-expect (launch 33 "a") 33)

(define (launch x ke)
  (cond
    [(string? x)
     (if (string=? " " ke) -3 x)]
    [(<= -3 x -1) x]
    [(>= x 0) x]))

; LRCD -> LRCD
; raises the rocket by YDELTA,
; if it is moving already
(define (fly x)
x)
