#|
Author: Mark Beltran
Date: August 5, 2023

Exercise 238. Abstract the two functions in figure 89 into a single function.
Both consume non-empty lists of numbers (Nelon) and produce a single number.
The left one produces the smallest number in the list, and the
right one the largest.

Define inf-1 and sup-1 in terms of the abstract function. Test them
with these two lists:

(list 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1)
(list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25)

Why are these functions slow on some of the long lists?

Modify the original functions with the use of max, which picks the
larger of two numbers, and min, which picks the smaller one. Then abstract
again, define inf-2 and sup-2, and test them with the same inputs again.
Why are these versions so much faster?
|#

; FUNCTIONS FROM FIGURE 89 /////////////////////////////////////////////////////

; Nelon -> Number
; determines the smallest
; number on l
(define (inf l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (if (< (first l)
            (inf (rest l)))
         (first l)
         (inf (rest l)))]))

; Nelon -> Number
; determines the largest
; number on l
(define (sup l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (if (> (first l)
            (sup (rest l)))
         (first l)
         (sup (rest l)))]))

; //////////////////////////////////////////////////////////////////////////////
