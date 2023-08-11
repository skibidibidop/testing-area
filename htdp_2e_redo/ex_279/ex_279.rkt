#|
Author: Mark Beltran
Date: August 12, 2023

Exercise 279. Decide which of the following phrases are legal lambda
expressions:

1. (lambda (x y) (x y y))
2. (lambda () 10)
3. (lambda (x) x)
4. (lambda (x y) x)
5. (lambda x 10)

Explain why they are legal or illegal. If in doubt, experiment in the
interactions area of DrRacket.
|#

; 1. (lambda (x y) (x y y))
; Illegal, no function provided. Also tried giving this
; another (lambda) as its x, did not work

; 2. (lambda () 10)
; Illegal, no variables provided

; 3. (lambda (x) x)
; Legal, returns x

; 4. (lambda (x y) x)
; Illegal, no function provided. Also, variable y provided but
; not used in expression

; 5. (lambda x 10)
; Illegal, does not follow (lambda (variables) (expression))
