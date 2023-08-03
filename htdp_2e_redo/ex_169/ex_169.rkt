#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 169. Design the function legal. Like translate from exercise 168,
the function consumes and produces a list of Posns. The result
contains all those Posns whose x-coordinates are between 0 and 100 and
whose y-coordinates are between 0 and 200.
|#

; List-of-posn -> List-of-posn
; Takes all Posns with x-coordinates between 0 and 100, and y-coordinates
; between 0 and 200 from lop and puts them in a new List-of-posn
(check-expect (legal '()) '())
(check-expect (legal (list (make-posn 99 201))) '())
(check-expect (legal (list (make-posn 101 199))) '())
(check-expect (legal (list (make-posn 50 40)
                           (make-posn 120 300)))
              (list (make-posn 50 40)))

(define (legal lop)
  (cond
    [(empty? lop) '()]
    [(and (> (posn-x (first lop)) 0)
               (< (posn-x (first lop)) 100)
               (> (posn-y (first lop)) 0)
               (< (posn-y (first lop)) 200))
     (cons
      (make-posn (posn-x (first lop)) (posn-y (first lop)))
      (legal (rest lop)))]
    [else (legal (rest lop))]))
    
