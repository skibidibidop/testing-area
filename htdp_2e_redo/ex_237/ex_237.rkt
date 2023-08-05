#|
Author: Mark Beltran
Date: August 5, 2023

Exercise 237. Evaluate (squared>? 3 10) and (squared>? 4 10)
in DrRacket. How about (squared>? 5 10)?
|#

; Number Number -> Boolean
; is the area of a square with side x larger than c
(define (squared>? x c)
  (> (* x x) c))

(squared>? 3 10) ; #false

(squared>? 4 10) ; #true

(squared>? 5 10) ; #true

