#|
Author: Mark Beltran
Date: July 30, 2023

Exercise 146. Design how-many for NEList-of-temperatures. Doing so
completes average, so ensure that average passes all of its tests, too.
|#

(define ERR_MSG "Non-empty list required.")

; NEList-of-temperatures -> Number
; Returns number of members of non-empty list nloi
(check-error  (how-many '()) ERR_MSG)
(check-expect (how-many (cons 1 '())) 1)
(check-expect (how-many (cons 1 (cons 2 '()))) 2)
(check-expect (how-many (cons 3 (cons 2 (cons 1 '())))) 3)

(define (how-many nloi)
  (cond
    [(empty? nloi) (error ERR_MSG)]
    [(empty? (rest nloi)) 1]
    [else
     (+ (how-many (rest nloi)) 1)]))
