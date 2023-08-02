#|
Author: Mark Beltran
Date: July 30, 2023

Exercise 147. Develop a data definition for NEList-of-Booleans, a representation
of non-empty lists of Boolean values. Then redesign the functions all-true and
one-true from exercise 140.
|#

; An NEList-of-Booleans is one of:
; (cons Boolean '())
; (cons Boolean NEList-of-Booleans)

(define ERR_MSG "Non-empty list required.")

; NEList-of-Booleans -> Boolean
; Checks if there is at least one #true value in nlob
(check-error  (one-true '()) ERR_MSG)
(check-expect (one-true (cons #true '())) #true)
(check-expect (one-true (cons #false '())) #false)
(check-expect (one-true (cons #true (cons #true '()))) #true)
(check-expect (one-true (cons #true (cons #false '()))) #true)
(check-expect (one-true (cons #false (cons #false '()))) #false)

(define (one-true nlob)
  (cond
    [(empty? nlob) (error ERR_MSG)]
    [(empty? (rest nlob)) (first nlob)]
    [else
     (or (first nlob)
         (one-true (rest nlob)))]))

; NEList-of-Booleans -> Boolean
; Checks if all members are #true
(check-error  (all-true '()) ERR_MSG)
(check-expect (all-true (cons #true '())) #true)
(check-expect (all-true (cons #false '())) #false)
(check-expect (all-true (cons #true (cons #false '()))) #false)
(check-expect (all-true (cons #true (cons #true '()))) #true)
(check-expect (all-true (cons #false (cons #true '()))) #false)
(check-expect (all-true (cons #false (cons #false '()))) #false)

(define (all-true nlob)
  (cond
    [(empty? nlob) (error ERR_MSG)]
    [(empty? (rest nlob)) (first nlob)]
    [else
     (and (first nlob)
          (all-true (rest nlob)))]))
