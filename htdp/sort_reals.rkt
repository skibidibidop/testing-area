#|
Author: Mark Beltran
Date: June 18, 2023

Code-along: 11.3 sample problem (sort reals)
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A num_list is one of:
; - '()
; - (cons Number num_list)
; Interp.: A list of numbers
; (define nl1 '())
; (define nl2 (cons 1 '()))
; (define nl3 (cons 1 (cons 2 '())))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; num_list -> num_list
; Sorts nl in descending order
(check-expect (sort_desc '()) '())
(check-expect (sort_desc (list 3 2 1)) (list 3 2 1))
(check-expect (sort_desc (list 1 2 3)) (list 3 2 1))
(check-expect (sort_desc (list 12 20 -5)) (list 20 12 -5))

(define (sort_desc nl)
  (cond
    [(empty? nl) '()]
    [else
     (insert (first nl) (sort_desc (rest nl)))]))

; Number num_list -> num_list
; Inserts n into sorted num_list
(check-expect (insert 5 '()) (list 5))
(check-expect (insert 5 (list 6)) (list 6 5))
(check-expect (insert 5 (list 4)) (list 5 4))
(check-expect (insert 12 (list 20 -5)) (list 20 12 -5))

(define (insert n nl)
  (cond
    [(empty? nl) ...]
    [else
     (...(first nl)...
         (insert n (rest nl))...)]))
