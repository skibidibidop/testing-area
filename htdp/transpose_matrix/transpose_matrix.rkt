;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname transpose_matrix) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 16, 2023

Transposes a matrix.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Row is one of:
; - '()
; - (cons Number Row)
; Interp.: a row in a matrix
(define row1 (cons 11 (cons 12 '())))
(define row2 (cons 21 (cons 22 '())))

; A Matrix is one of:
; (cons Row '())
; (cons Row Matrix)
; Constraint: all rows in matrix are of the same length
(define mat1 (cons row1 (cons row2 '())))

; A Num_list is one of:
; - '()
; (cons Number Num_list)
; Interp.: a list of Numbers
(define nl1 (cons 1 (cons 2 '())))

; An Lnl (short for list_of_num_lists) is one of:
; '()
; (cons Num_list Lnl)
; Interp.: a list of num_lists
(define lnl1 (cons
              (cons 1 (cons 2 '()))
              (cons
               (cons 3 (cons 4 '()))
               '())))

; FUNCTIONS & RELATED //////////////////////////////////////////////////////////

; Matrix -> Matrix
; Transposes the given matrix along the diagonal

(define wor1 (cons 11 (cons 21 '())))
(define wor2 (cons 12 (cons 22 '())))
(define tam1 (cons wor1 (cons wor2 '())))

(check-expect (transpose mat1) tam1)

(define (transpose mat)
  (cond
    [(empty? (first mat)) '()]
    [else
     (cons (first* mat) (transpose (rest* mat)))]))

; Matrix -> Num_list
; Takes the first members of all num_lists in a matrix (aka column 1)
; and creates a new Row
(define (first* mat) '()