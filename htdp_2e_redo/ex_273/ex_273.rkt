#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 273. The fold functions are so powerful that you can define
almost any list processing functions with them. Use fold to define map.
|#

; (X -> Y) [List-of X] -> [List-of Y]
; Define the function map using fold
(check-expect (own_map add1 '()) '())
(check-expect (own_map add1 (list 0 1 2))
              (list 1 2 3))

(define (own_map f l)
  (local
    [(define (applicator i b)
       (if (empty? i)
           '()
           (cons (f i) b)))]
    (foldr applicator '() l)))
