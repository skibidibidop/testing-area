#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 168. Design the function translate. It consumes and produces lists
of Posns. For each (make-posn x y) in the former, the latter contains
(make-posn x (+ y 1)). We borrow the word “translate” from geometry, where
the movement of a point by a constant distance along a straight line is
called a translation.
|#

; List-of-posn -> List-of-posn
; Increases each y-coordinate in lop by 1
(check-expect (translate '()) '())
(check-expect (translate (list (make-posn 30 40)
                               (make-posn 10 10)
                               (make-posn 20 30)))
              (list (make-posn 30 41)
                    (make-posn 10 11)
                    (make-posn 20 31)))

(define (translate lop)
  (cond
    [(empty? lop) '()]
    [else
     (cons
      (make-posn (posn-x (first lop))
                 (+ (posn-y (first lop)) 1))
      (translate (rest lop)))]))
