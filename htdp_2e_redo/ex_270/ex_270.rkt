#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 270. Use build-list to define a function that

1. creates the list (list 0 ... (- n 1)) for any natural number n;
2. creates the list (list 1 ... n) for any natural number n;
3. creates the list (list 1 1/2 ... 1/n) for any natural number n;
4. creates the list of the first n even numbers; and
5. creates a diagonal square of 0s and 1s; see exercise 262.

Finally, define tabulate from exercise 250 using build-list.
|#

; 1. creates the list (list 0 ... (- n 1)) for any natural number n;

; Number -> [List-of Number]
; Generates a list from 0 to (- n 1)
(check-expect (list_to_1less 0) '())
(check-expect (list_to_1less 10)
              (list 0 1 2 3 4 5 6 7 8 9))

(define (list_to_1less n)
  (build-list n identity))

