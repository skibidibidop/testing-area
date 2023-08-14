#|
Author: Mark Beltran
Date: August 15, 2023

Exercise 293. Develop found?, a specification for the find function:

(see (find))

Use found? to formulate a check-satisfied test for find.
|#

; X [List-of X] -> [Maybe [List-of X]]
; returns the first sublist of l that starts
; with x, #false otherwise
(define (find x l)
  (cond
    [(empty? l) #false]
    [else
     (if (equal? (first l) x) l (find x (rest l)))]))
