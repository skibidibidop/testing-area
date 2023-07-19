#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 55. Take another look at show. It contains three instances of an
expression with the approximate shape:

(place-image ROCKET 10 (- ... CENTER) BACKG)

This expression appears three times in the function: twice to draw a resting
rocket and once to draw a flying rocket. Define an auxiliary function that
performs this work and thus shorten show. Why is this a good idea? You
may wish to reread the Prologue.
|#


(require 2htdp/image)

(define HEIGHT 300)
(define WIDTH 100)
(define YDELTA 3)
(define BACKG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
(define CENTER (/ (image-height ROCKET) 2))

; LRCD -> Image
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
(define (show_aux pos)
  (place-image ROCKET
               10 (- pos CENTER)
               BACKG))
