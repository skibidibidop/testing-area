#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 272. Recall that the append function in ISL concatenates the
items of two lists or, equivalently, replaces '() at the end of the first list
with the second list:

(equal? (append (list 1 2 3) (list 4 5 6 7 8))
        (list 1 2 3 4 5 6 7 8))

Use foldr to define append-from-fold. What happens if you replace
foldr with foldl?

Now use one of the fold functions to define functions that compute the
sum and the product, respectively, of a list of numbers.

With one of the fold functions, you can define a function that horizon-
tally composes a list of Images.

Hints
(1) Look up beside and empty-image. Can you use the other fold function?
Also define a function that stacks a list of images vertically.
(2) Check for above in the libraries.
|#

; [List-of Any] [List-of Any] -> [List-of Any]
; Appends two lists together using the fold function
(check-expect (append-from-fold '() '()) '())
(check-expect (append-from-fold (list 1 2) '())
              (list 1 2))
(check-expect (append-from-fold '() (list 3 4))
              (list 3 4))
(check-expect (append-from-fold (list 1 2) (list 3 4))
              (list 1 2 3 4))

(define (append-from-fold list1 list2)
  (local
    [(define (add_to_list element l)
       (cond
         [(empty? element) l]
         [else
          (cons element l)]))]
    (foldr add_to_list list2 list1)))

; foldl instead of foldr reverses the first list and then appends
; list2 to the reveresed list
(define (append-from-fold2 list1 list2)
  (local
    [(define (add_to_list element l)
       (cond
         [(empty? element) l]
         [else
          (cons element l)]))]
    (foldl add_to_list list2 list1)))

; Now use one of the fold functions to define functions that compute the
; sum and the product, respectively, of a list of numbers.

(define ADD_BASE 0)
(define MUL_BASE 1)

; [List-of Number] -> Number
; Returns the sum of all the numbers in the list
(check-expect (list_sum '()) ADD_BASE)
(check-expect (list_sum (list 1 5 2 4)) 12)

(define (list_sum ln)
  (foldl + ADD_BASE ln))

; [List-of Number] -> Number
; Returns the product of all the numbers in the list
(check-expect (list_prod '()) MUL_BASE)
(check-expect (list_prod (list 1 2 3 4)) 24)

(define (list_prod ln)
  (foldl * MUL_BASE ln))
