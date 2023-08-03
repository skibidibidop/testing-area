#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 167. Design the function sum, which consumes a list of Posns
and produces the sum of all of its x-coordinates.
|#

; List-of-posns -> Number
; Returns the sum of all x-coordinates in List-of-posn lop
(check-expect (sum '()) 0)
(check-expect (sum (list (make-posn 40 50)
                         (make-posn 10 20)
                         (make-posn 50 100)))
              100)

(define (sum lop)
  (cond
    [(empty? lop) 0]
    [else
     (+ (posn-x (first lop))
        (sum (rest lop)))]))
