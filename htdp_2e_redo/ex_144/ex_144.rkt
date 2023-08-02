#|
Author: Mark Beltran
Date: July 30, 2023

Exercise 144. Will sum and how-many work for NEList-of-temperatures
even though they are designed for inputs from List-of-temperatures? If you
think they don’t work, provide counter-examples. If you think they would,
explain why.
|#

; They seem to work, but here are alternatives:

(define ERR_MSG "Non-empty list needed.")

; NElist-of-temperatures -> Number
; Returns sum of members of nloi
(check-error (ne_sum '()) ERR_MSG)
(check-expect (ne_sum (cons 1 '())) 1)
(check-expect (ne_sum (cons 1 (cons 2 '()))) 3)

(define (ne_sum nloi)
  (cond
    [(empty? nloi) (error ERR_MSG)]
    [(empty? (rest nloi)) (first nloi)]
    [else
     (+ (first nloi)
        (ne_sum (rest nloi)))]))

; NElist-of-temperatures -> Number
; Returns number of members of the non-emty list nloi
(check-error (ne_how_many '()) ERR_MSG)
(check-expect (ne_how_many (cons 1 '())) 1)
(check-expect (ne_how_many (cons 1 (cons 2 '()))) 2)

(define (ne_how_many nloi)
  (cond
    [(empty? nloi) (error ERR_MSG)]
    [(empty? (rest nloi)) 1]
    [else
     (+ (ne_how_many (rest nloi)) 1)]))
