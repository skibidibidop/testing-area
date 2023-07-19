#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 49. Use the stepper to evaluate the expression for y as 100 and 210.
Nesting cond expressions can eliminate common expressions. Consider the
function for launching a rocket, repeated in figure 20. Both branches
of the cond expression have the same shape except as indicated with ...:

(place-image ROCKET X ... MTSCN)

(define WIDTH 100)
(define HEIGHT 60)
(define MTSCN (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle (/ WIDTH 5) (/ HEIGHT 2) "solid" "red"))
(define ROCKET-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2)))

(define (create-rocket-scene.v5 h)
  (cond
    [(<= h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 h MTSCN)]
    [(> h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)]))

Reformulate create-rocket-scene.v5 to use a nested expression;
the resulting function mentions place-image only once.
|#

(require 2htdp/image)

(define WIDTH 100)
(define HEIGHT 60)
(define MTSCN (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle (/ WIDTH 5) (/ HEIGHT 2) "solid" "red"))
(define ROCKET-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2)))

(define ROCKET_XPOS 50)

(define (create_rocket_scene.v5 h)
  (place-image
   ROCKET
   ROCKET_XPOS
   (cond
     [(<= h ROCKET-CENTER-TO-TOP)
      h]
     [else
      ROCKET-CENTER-TO-TOP])
   MTSCN))
               
