#|
Author: Mark Beltran
Date: July 28, 2023

Exercise 112. Reformulate the predicate now using an or expression.
|#

(define (missile-or-not? v)
  (cond
    [(false? v) #true]
    [(posn? v) #true]
    [else #false]))

; Reformulated with or:
(define (missile-or-not2? v)
  (or (false? v) (posn? v)))
