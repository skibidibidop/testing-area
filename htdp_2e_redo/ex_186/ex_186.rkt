#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 186. Take a second look at intermezzo 1, the intermezzo that
presents BSL and its ways of formulating tests. One of the latter is check-
satisfied, which determines whether an expression satisfies a certain
property. Use sorted>? from exercise 145 to reformulate the tests for
sort> with check-satisfied.

Now consider this function definition:

; List-of-numbers -> List-of-numbers
; produces a sorted version of l
(define (sort>/bad l)
(list 9 8 7 6 5 4 3 2 1 0))

Can you formulate a test case that shows that sort>/bad is not a sorting
function? Can you use check-satisfied to formulate this test case?
|#

(define ERR_MSG "Non-empty list required.")

; NEList-of-temperatures -> Boolean
; Checks if non-empty list nloi is sorted in descending order
(check-error  (sorted>? '()) ERR_MSG)
(check-expect (sorted>? (cons 1 '())) #true)
(check-expect (sorted>? (cons 0 (cons 1 '()))) #false)
(check-expect (sorted>? (cons 0 (cons 2 (cons 1 '())))) #false)
(check-expect (sorted>? (cons 3 (cons 2 (cons 1 '())))) #true)

(define (sorted>? nloi)
  (cond
    [(empty? nloi) (error ERR_MSG)]
    [(empty? (rest nloi)) #true]
    [else
     (and (> (first nloi) (first (rest nloi)))
          (sorted>? (rest nloi)))]))

; NEList-of-temperatures -> Boolean
; Checks if non-empty list nloi is sorted in ascending order
(check-error  (sorted<? '()) ERR_MSG)
(check-expect (sorted<? (cons 1 '())) #true)
(check-expect (sorted<? (cons 0 (cons 1 '()))) #true)
(check-expect (sorted<? (cons 0 (cons 2 (cons 1 '())))) #false)
(check-expect (sorted<? (cons 3 (cons 2 (cons 1 '())))) #false)

(define (sorted<? nloi)
  (cond
    [(empty? nloi) (error ERR_MSG)]
    [(empty? (rest nloi)) #true]
    [else
     (and (< (first nloi) (first (rest nloi)))
          (sorted<? (rest nloi)))]))

; List-of-numbers -> List-of-numbers
; produces a sorted version of l
(check-satisfied (sort> (list 0 1 2 3)) sorted>?)
(check-satisfied (sort> (list 3 2 1 0)) sorted>?)
(check-satisfied (sort> (list 2 3 1 0)) sorted>?)

(define (sort> l)
  (cond
    [(empty? l) '()]
    [(cons? l) (insert (first l) (sort> (rest l)))]))

; Number List-of-numbers -> List-of-numbers
; inserts n into the sorted list of numbers l
(define (insert n l)
  (cond
    [(empty? l) (cons n '())]
    [else (if (>= n (first l))
              (cons n l)
              (cons (first l) (insert n (rest l))))]))

; List-of-numbers -> List-of-numbers
; produces a sorted version of l
(check-satisfied (sort>/bad (list 0 4 1 3 2)) sorted>?)
(check-satisfied (sort>/bad (list 1)) sorted<?)

(define (sort>/bad l)
  (list 9 8 7 6 5 4 3 2 1 0))
