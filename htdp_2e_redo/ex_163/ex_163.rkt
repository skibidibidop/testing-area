#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 163. Design convertFC. The function converts a list of measurements
in Fahrenheit to a list of Celsius measurements.
|#

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
;
(define (converFC loF) '())
