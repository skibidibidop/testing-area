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
(check-expect (sorted>? '()) #true)
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

; List-of-gp -> List-of-gp
; produces a sorted version of l
(check-expect (sort> '()) '())
(check-satisfied (sort> '()) sorted>?)
(check-satisfied (sort> (list (make-gp "P1" 10)
                              (make-gp "P2" 20)
                              (make-gp "P3" 30)))
                 sorted>?)
(check-satisfied (sort> (list (make-gp "P1" 50)
                              (make-gp "P2" 80)
                              (make-gp "P3" 70)
                              (make-gp "P4" 60)))
                 sorted>?)
(check-satisfied (sort> (list (make-gp "P1" 50)
                              (make-gp "P2" 40)
                              (make-gp "P3" 30)))
                 sorted>?)

(define (sort> l)
  (cond
    [(empty? l) '()]
    [(cons? l) (insert (first l) (sort> (rest l)))]))

; Number List-of-numbers -> List-of-numbers
; inserts n into the sorted list of numbers l
(define (insert n l)
  (cond
    [(empty? l) (cons n '())]
    [else (if (>= n (first l))
              (cons n l)
              (cons (first l) (insert n (rest l))))]))
