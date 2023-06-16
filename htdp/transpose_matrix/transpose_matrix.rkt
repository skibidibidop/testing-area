;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname transpose_matrix) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 16, 2023

Transposes a matrix.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A row is one of:
; - '()
; - (cons Number row)
; Interp.: a row in a matrix
(define row1 (cons 11 (cons 12 '())))
(define row2 (cons 21 (cons 22 '())))

; A matrix is one of:
; (cons row '())
; (cons row matrix)
; Constraint: all rows in matrix are of the same length
(define mat1 (cons row1 (cons row2 '())))

; FUNCTIONS & RELATED //////////////////////////////////////////////////////////
