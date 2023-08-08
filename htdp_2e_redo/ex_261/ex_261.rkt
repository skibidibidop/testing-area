#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 261. Consider the function definition in figure 101. Both clauses
in the nested cond expression extract the first item from an-inv and both
compute (extract1 (rest an-inv)). Use local to name this expression. Does
this help increase the speed at which the function computes its result?
Significantly? A little bit? Not at all?
|#

(define-struct ir [name price])
; (make-ir String Number)
; Interp.: (make-ir n p), represents an inventory report which contains an
; item's name (n) and price (p)

; An Inventory is one of:
; '()
; (cons IR Inventory)

(define IR1 (list (make-ir "Item1" 30)
                  (make-ir "Item2" 10)
                  (make-ir "Item3" 40)
                  (make-ir "Item4" 50)
                  (make-ir "Item5" 0.5)
                  (make-ir "Item6" 0.3)
                  (make-ir "Item7" 10)
                  (make-ir "Item8" 0.1)
                  (make-ir "Item9" 0.2)
                  (make-ir "Item10" 0.7)
                  (make-ir "Item11" 20)))


; Function from figure 101:

; Inventory -> Inventory
; creates an Inventory from an-inv for all
; those items that cost less than a dollar
(define (extract1 an-inv)
  (cond
    [(empty? an-inv) '()]
    [else
     (cond
       [(<= (ir-price (first an-inv)) 1.0)
        (cons (first an-inv) (extract1 (rest an-inv)))]
       [else (extract1 (rest an-inv))])]))

(define (extract2 an-inv)
  (cond
    [(empty? an-inv) '()]
    [else
     (local ((define first-of-inv (first an-inv))
             (define extracted (extract2 (rest an-inv))))
       (cond
         [(<= (ir-price first-of-inv) 1.0)
          (cons first-of-inv extracted)]
         [else extracted]))]))

; Running (time (extract1 IR1)) and (time (extract2 IR1)) produce the
; same result
