#|
Author: Mark Beltran
Date: June 10, 2023

Computes the average of all Celsius temperatures in a non-empty list.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; a cels_temp is a Number greater than -272
; Interp.: represents temperature in Celsius

; a non_empty_list is one of:
; - (cons cels_temp '())
; - (cons cels_temp non_empty_list)
; Interp.: non-empty list of temperatures in Celsius
; (define nl1 (cons -271 '()))
; (define nl2 (cons 0 (cons 50 '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; non_empty_list -> Number
; Returns count of list members
(check-expect (how_many (cons 3 (cons 2 '()))) 2)
(check-expect (how_many (cons 5 '())) 1)

(define (how_many nlist)
  (cond[(empty? (rest nlist)) 1]
       [else (+ (how_many (rest nlist)) 1)]))

; non_empty_list -> Number
; Returns sum of list members
(check-expect (sum (cons 5 (cons 0 '()))) 5)
(check-expect (sum (cons -10 (cons 4 (cons 6 '())))) 0)
(check-expect (sum (cons 0 (cons -4 '()))) -4)

(define (sum nlist)
  (cond[(empty? (rest nlist)) (first nlist)]
       [else (+ (first nlist) (sum (rest nlist)))]))

; non_empty_list -> Number
; Returns average of list members
(check-expect (average (cons 3 (cons 4 (cons 5 '())))) 4)
(check-expect (average (cons 0 (cons 0 (cons 0 '())))) 0)
(check-expect (average (cons -3 (cons -4 (cons -5 '())))) -4)

(define (average nlist)
  (/ (sum nlist) (how_many nlist)))
