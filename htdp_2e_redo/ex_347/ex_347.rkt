#|
Author: Mark Beltran
Date: August 29, 2023

Exercise 347. Design eval-expression. The function consumes a representation
of a BSL expression and computes its value.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct add [left right])
(define-struct mul [left right])

; A BSL-expr is one of:
; Number
; Add
; Mul

; A Result is a Number
; Interp.: result of evaluating a BSL-expr

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; BSL-expr -> Result
; Returns result of evaluating bsl
(check-expect (eval-expression 3) 3)
(check-expect (eval-expression (make-add 4 5)) 9)
(check-expect (eval-expression (make-mul 2 10)) 20)

(define (eval-expression bsl)
  (cond
    [(number? bsl) bsl]
    [(add? bsl)
     (+ (add-left bsl) (add-right bsl))]
    [(mul? bsl)
     (* (mul-left bsl) (mul-right bsl))]))s
