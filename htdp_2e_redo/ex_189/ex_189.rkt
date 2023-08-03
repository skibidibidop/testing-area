#|
Author: Mark Beltran
Date: August 4, 2023

Exercise 189. Here is the function search:

; Number List-of-numbers -> Boolean
(define (search n alon)
  (cond
    [(empty? alon) #false]
    [else (or (= (first alon) n)
              (search n (rest alon)))]))

It determines whether some number occurs in a list of numbers. The function may
have to traverse the entire list to find out that the number of interest isn’t
contained in the list.

Develop the function search-sorted, which determines whether a number occurs in
a sorted list of numbers. The function must take advantage of the fact that
the list is sorted.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Number List-of-numbers -> Boolean
(define (search n alon)
  (cond
    [(empty? alon) #false]
    [else (or (= (first alon) n)
              (search n (rest alon)))]))

; Number List-of-numbers -> Boolean
; Checks if Number n occurs in sorted List-of-numbers lon
(check-expect (search-sorted 1 '()) #false)
(check-expect (search-sorted 1 (list 1 2 3 4)) #true)
(check-expect (search-sorted 1 (list 2 3 4 5)) #false)

(define (search-sorted n lon) #false)
