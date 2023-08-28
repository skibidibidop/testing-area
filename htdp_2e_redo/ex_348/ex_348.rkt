#|
Author: Mark Beltran
Date: August 29, 2023

Exercise 348. Develop a data representation for Boolean BSL expressions
constructed from #true, #false, and, or, and not. Then design
eval-bool-expression, which consumes (representations of) Boolean BSL
expressions and computes their values. What kind of values do these Boolean
expressions yield?
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

; A BSL-bool is one of:
; #true
; #false
; and
; or
; not

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; BSL-bool -> Boolean
; Returns the result of evalutaion bslb
(check-expect (eval-bool-exp #true) #true)
(check-expect (eval-bool-exp #false) #false)
(check-expect (eval-bool-exp (and #true #true)) #true)
(check-expect (eval-bool-exp (and #true #false)) #false)
(check-expect (eval-bool-exp (or #true #true)) #true)
(check-expect (eval-bool-exp (or #true #false)) #true)
(check-expect (eval-bool-exp (or #false #false)) #false)
(check-expect (eval-bool-exp (not #true)) #false)
(check-expect (eval-bool-exp (not #false)) #true)

(define (eval-bool-exp bslb) #false)
