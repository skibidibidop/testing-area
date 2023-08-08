#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 261. Consider the function definition in figure 101. Both clauses
in the nested cond expression extract the first item from an-inv and both
compute (extract1 (rest an-inv)). Use local to name this expression. Does
this help increase the speed at which the function computes its result?
Significantly? A little bit? Not at all?
|#

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

