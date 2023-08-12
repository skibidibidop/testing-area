#|
Author: Mark Beltran
Date: August 12, 2023

Exercise 288. Use build-list and lambda to define a function that

1. creates the list (list 0 ... (- n 1)) for any natural number n;
2. creates the list (list 1 ... n) for any natural number n;
3. creates the list (list 1 1/2 ... 1/n) for any natural number n;
4. creates the list of the first n even numbers; and
5. creates a diagonal square of 0s and 1s; see exercise 262.

Also define tabulate with lambda.
|#

; 1. creates the list (list 0 ... (- n 1)) for any natural number n;
(check-expect (list_from_zero 0) '())
(check-expect (list_from_zero 3) (list 0 1 2))

; Number -> [List-of Number]
(define (list_from_zero n)
  (build-list
   n
   (lambda (x) (identity x))))
