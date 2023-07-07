#|
Author: Mark Beltran
Date: May 22, 2023

Practice posn structure
|#

; Computes the distance of ap to the origin
(check-expect (distance_to_0 (make-posn 0 5)) 5)
(check-expect (distance_to_0 (make-posn 6 0)) 6)
(check-expect (distance_to_0 (make-posn 3 4)) 5)
(check-expect (distance_to_0 (make-posn 8 6)) 10)
(check-expect (distance_to_0 (make-posn 5 12)) 13)
(define (distance_to_0 ap)
  (sqrt
   (+
    (sqr (posn-x ap))
    (sqr (posn-y ap)))))

(distance_to_0 (make-posn 3 4))
(distance_to_0 (make-posn 6 (* 2 4)))
(+ (distance_to_0 (make-posn 12 5)) 10)
