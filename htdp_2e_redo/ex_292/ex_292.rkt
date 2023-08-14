#|
Author: Mark Beltran
Date: August 15, 2023

Exercise 292. Design the function sorted?, which comes with the following
signature and purpose statement:

(see below)

The wish list even includes examples.
|#

(define ERR_MSG "Needs non-empty list.")

; [X X -> Boolean] [NEList-of X] -> Boolean
; determines whether l is sorted according to cmp
(check-expect (sorted? < '(1 2 3)) #true)
(check-expect (sorted? < '(2 1 3)) #false)

(define (sorted? cmp l)
 (cond
   [(empty? l) (error ERR_MSG)]
   [(empty? (rest l)) #true]
   [else
    (and (cmp (first l) (first (rest l)))
         (sorted? cmp (rest l)))]))
