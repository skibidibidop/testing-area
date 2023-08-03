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

; NEList-of-temperatures -> Boolean
; Checks if non-empty list nloi is sorted in descending order
(check-expect (sorted>? (cons 1 '())) #true)
(check-expect (sorted>? (cons 0 (cons 1 '()))) #false)
(check-expect (sorted>? (cons 0 (cons 2 (cons 1 '())))) #false)
(check-expect (sorted>? (cons 3 (cons 2 (cons 1 '())))) #true)

(define (sorted>? nloi)
  (cond
    [(empty? nloi) #true]
    [(empty? (rest nloi)) #true]
    [else
     (and (> (first nloi) (first (rest nloi)))
          (sorted>? (rest nloi)))]))

; List-of-numbers -> List-of-numbers
; produces a sorted version of l
(check-satisfied (sort> (list 0 1 2 3)) sorted>?)
(check-satisfied (sort> (list 3 2 1 0)) sorted>?)
(check-satisfied (sort> (list 2 3 1 0)) sorted>?)

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

; List-of-gp -> List-of-gp
; Sorts GamePlayers based on score (descending)
(check-expect (sort-gp '()) '())
(check-satisfied (sort-gp (list (make-gp "Player 1" 10))) sorted>?)
(check-satisfied (sort-gp (list (make-gp "Player 1" 50)
                                (make-gp "Player 2" 60)
                                (make-gp "Player 3" 80))) sorted>?)

(define (sort-gp lgp)
  (cond
    [(empty? lgp) '()]
    [else (sort> (get-list lgp))]))

; List-of-gp -> List-of-numbers
; Creates a list of gp-scores from a List-of-gp
(define (get-list lgp)
  (cond
    [(empty? lgp) '()]
    [else
     (cons (gp-score (first lgp))
           (get-list (rest lgp)))]))
