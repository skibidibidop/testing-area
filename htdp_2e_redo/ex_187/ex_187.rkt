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

; List-of-gp -> Boolean
; Checks if list lon is sorted in descending order
(check-expect (sorted>? '()) #true)
(check-expect (sorted>? (list (make-gp "P1" 30)
                              (make-gp "P2" 20)
                              (make-gp "P3" 10))) #true)
(check-expect (sorted>? (list (make-gp "P1" 20)
                              (make-gp "P2" 30))) #false)

(define (sorted>? l)
  (cond
    [(empty? l) #true]
    [(empty? (rest l)) #true]
    [else
     (and (> (gp-score (first l)) (gp-score(first (rest l))))
          (sorted>? (rest l)))]))

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

; Gp List-of-gp -> List-of-gp
; inserts agp into the sorted List-of-gp lgp
(define (insert agp lgp)
  (cond
    [(empty? lgp) (cons agp '())]
    [else (if (>= (gp-score agp) (gp-score (first lgp)))
              (cons agp lgp)
              (cons (first lgp) (insert agp (rest lgp))))]))
