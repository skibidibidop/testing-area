#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 163. Design convertFC. The function converts a list of measurements
in Fahrenheit to a list of Celsius measurements.
|#

(define F_CONST1 32)
(define F_CONST2 (/ 5 9))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A List-of-F is one of:
; '()
; (cons FTemp List-of-F)
; Interp.: A list of temperature readings in degrees Fahrenheit

; A List-of-C is one of:
; '()
; (cons CTemp List-of-C)
; Interp.: A list of temperature readings in degrees Celsius

; An FTemp is a temperature reading in degrees Fahrenheit

; A CTemp is a temperature reading in degrees Celsius

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; List-of-F -> List-of-C
; Converts a list of temperature readings in degrees Fahrenheit to a list
; of temperature readings in degrees Celsius
(check-expect (convertFC '()) '())
(check-expect (convertFC (list 32)) (list 0))
(check-expect (convertFC (list 500 320)) (list 260 160))

(define (convertFC loF)
  (cond
    [(empty? loF) '()]
    [else
     (cons (FtoC (first loF))
           (convertFC (rest loF)))]))

; FTemp -> CTemp
; Converts an FTemp to a CTemp
(check-expect (FtoC 32) 0)
(check-expect (FtoC 500) 260)

(define (FtoC fah)
  (* (- fah F_CONST1)
     F_CONST2))
