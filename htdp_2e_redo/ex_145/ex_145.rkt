#|
Author: Mark Beltran
Date: July 30, 2023

Exercise 145. Design the sorted>? predicate, which consumes a
NEListof-temperatures and produces #true if the temperatures are sorted in
descending order. That is, if the second is smaller than the first, the third
smaller than the second, and so on. Otherwise it produces #false.
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
            
