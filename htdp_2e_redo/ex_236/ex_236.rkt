#|
Author: Mark Beltran
Date: August 5, 2023

Exercise 236. Create test suites for the following two functions:

(see add1* and plus5)

Then abstract over them. Define the above two functions in terms of the
abstraction as one-liners and use the existing test suites to confirm that the
revised definitions work properly. Finally, design a function that subtracts
2 from each number on a given list.
|#

; Lon -> Lon
; adds 1 to each item on l
(check-expect (add1* '()) '())
(check-expect (add1* (list 1 0)) (list 2 1))
(check-expect (add1* (list 0 2 3 1)) (list 1 3 4 2))

(define (add1* l)
  (cond
    [(empty? l) '()]
    [else
     (cons
      (add1 (first l))
      (add1* (rest l)))]))

; Lon -> Lon
; adds 5 to each item on l
(check-expect (plus5 '()) '())
(check-expect (plus5 (list 1 0)) (list 6 5))
(check-expect (plus5 (list 0 2 3 1)) (list 5 7 8 6))

(define (plus5 l)
  (cond
    [(empty? l) '()]
    [else
     (cons
      (+ (first l) 5)
      (plus5 (rest l)))]))

