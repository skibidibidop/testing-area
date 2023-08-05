#|
Author: Mark Beltran
Date: August 5, 2023

Exercise 235. Use the contains? function to define functions that
search for "atom", "basic", and "zoo", respectively.
|#

; String Los -> Boolean
; determines whether l contains the string s
(define (contains? s l)
  (cond
    [(empty? l) #false]
    [else (or (string=? (first l) s)
              (contains? s (rest l)))]))

; Los -> Boolean
(define (contains-atom? l)
  (contains? "atom" l))

; Los -> Boolean
(define (contains-basic? l)
  (contains? "basic" l))

; Los -> Boolean
(define (contains-zoo? l)
  (contains? "zoo" l))
