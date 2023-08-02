#|
Author: Mark Beltran
Date: July 30, 2023

Exercise 143. Determine how average behaves in DrRacket when applied to the
empty list. Then design checked-average, a function that produces an
informative error message when it is applied to '().
|#

; List-of-temperatures -> Number
; adds up the temperatures on the given list
(define (sum alot)
  (cond
    [(empty? alot) 0]
    [else (+ (first alot) (sum (rest alot)))]))

; List-of-temperatures -> Number
; counts the temperatures on the given list
(define (how-many alot)
  (cond
    [(empty? alot) 0]
    [else
     (+ (how-many (rest alot)) 1)]))

; List-of-temperatures -> Number
; computes the average temperature
(define (average alot)
  (/ (sum alot) (how-many alot)))

; (average '()) results in a division by zero error

; List-of-temperatures -> Number
; Computes the average temperature
(define (checked-average alot)
  (cond
    [(empty? alot) (error "List provided is empty.")]
    [else
     (average alot)]))

