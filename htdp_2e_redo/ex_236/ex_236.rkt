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

; Number List-of-number -> List-of-number
; Adds num n to all members of l
(check-expect (add_num 1 '()) '())
(check-expect (add_num 2 (list 0 1)) (list 2 3))

(define (add_num n l)
  (cond
    [(empty? l) '()]
    [else
     (cons (+ n (first l))
           (add_num n (rest l)))]))

; List-of-number -> List-of-number
; Adds 1 to each item on l
(check-expect (add_one '()) '())
(check-expect (add_one (list 1 0)) (list 2 1))
(check-expect (add_one (list 0 2 3 1)) (list 1 3 4 2))

(define (add_one l)
  (add_num 1 l))

; List-of-number -> List-of-number
; Adds 5 to each item on l
(check-expect (add_5 '()) '())
(check-expect (add_5 (list 1 0)) (list 6 5))
(check-expect (add_5 (list 0 2 3 1)) (list 5 7 8 6))

(define (add_5 l)
  (add_num 5 l))

; (Number -> Number) Number List-of-number -> List-of-number
; Applies (op n) to all members of l
(check-expect (operate + 3 '()) '())
(check-expect (operate + 5 (list 4 3)) (list 9 8))
(check-expect (operate * 2 (list 1 3)) (list 2 6))
(check-expect (operate - 1 (list 1 0)) (list 0 -1))

(define (operate op n l)
  (cond
    [(empty? l) '()]
    [else
     (cons
      (op (first l) n)
      (operate op n (rest l)))]))

; List-of-number -> List-of-number
(check-expect (sub_2 '()) '())
(check-expect (sub_2 (list 1 2)) (list -1 0))

(define (sub_2 l)
  (operate - 2 l))
