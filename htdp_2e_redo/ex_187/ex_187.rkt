#|
Author: Mark Beltran
Date: August 4, 2023

Exercise 187. Design a program that sorts lists of game players by score:

(define-struct gp [name score])
; A GamePlayer is a structure:
; (make-gp String Number)
; interpretation (make-gp p s) represents player p who
; scored a maximum of s points

Hint Formulate a function that compares two elements of GamePlayer.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct gp [name score])
; A GamePlayer is a structure:
; (make-gp String Number)
; interpretation (make-gp p s) represents player p who
; scored a maximum of s points

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; List-of-numbers -> Boolean
; Checks if list lon is sorted in descending order
(check-error  (sorted>? '()) #true)
(check-expect (sorted>? (cons 1 '())) #true)
(check-expect (sorted>? (cons 0 (cons 1 '()))) #false)
(check-expect (sorted>? (cons 0 (cons 2 (cons 1 '())))) #false)
(check-expect (sorted>? (cons 3 (cons 2 (cons 1 '())))) #true)

(define (sorted>? lon)
  (cond
    [(empty? lon) #true]
    [(empty? (rest lon)) #true]
    [else
     (and (> (first lon) (first (rest lon)))
          (sorted>? (rest lon)))]))
