#|
Author: Mark Beltran
Date: May 20, 2023

Refactor code from Exercise 49 to use only
one place-image expression with the help of
nested conds.
|#

(require 2htdp/image)

(define WIDTH  100)
(define HEIGHT  60)
(define MTSCN  (empty-scene WIDTH HEIGHT)) ; short for empty scene

(define ROCKET
  (triangle 5 "solid" "red"))
(define ROCKET-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2)))
 
(define (create-rocket-scene.v5 h)
  (cond
    [(cond[(> h ROCKET-CENTER-TO-TOP)
           (= h ROCKET-CENTER-TO-TOP)]
          [else (= h h)])
     (place-image ROCKET 50 h MTSCN)]))

  #| ORIGINAL CODE:
  (cond
    [(<= h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 h MTSCN)]
    [(> h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)]))
|#

(create-rocket-scene.v5 50)
