#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 161. Translate the examples into tests and make sure they all
succeed. Then change the function in figure 64 so that everyone gets $14
per hour. Now revise the entire program so that changing the wage for
everyone is a single change to the entire program and not several.
|#

(define HOURLY_RATE 14)

; DATA DEFINITION //////////////////////////////////////////////////////////////

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Number -> Number
; computes the wage for h hours of work
(define (wage h)
  (* HOURLY_RATE h))

; List-of-numbers -> List-of-numbers
; computes the weekly wages for all given weekly hours
(check-expect (wage* '()) '())
(check-expect (wage* (cons 28 '())) (cons (* 28 HOURLY_RATE) '()))
(check-expect (wage* (cons 4 (cons 2 '())))
              (cons (* 4 HOURLY_RATE) (cons (* 2 HOURLY_RATE) '())))

(define (wage* whrs)
  (cond
    [(empty? whrs) '()]
    [else (cons (wage (first whrs)) (wage* (rest whrs)))]))
