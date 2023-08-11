#|
Author: Mark Beltran
Date: August 12, 2023

Exercise 285. Use map to define the function convert-euro, which
converts a list of US$ amounts into a list of EUR amounts based on an
exchange rate of US$1.06 per EUR.

Also use map to define convertFC, which converts a list of Fahrenheit
measurements to a list of Celsius measurements.

Finally, try your hand at translate, a function that translates a list of
Posns into a list of lists of pairs of numbers.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A USD is an amount in US Dollars

; An EUR is an amount in Euros

; A TFahr is a temperature reading in degrees Fahrenheit

; A TCels is a temperature reading in degrees Celsius

(define USD_TO_EUR 1.6)
(define FAHR_CONST1 32)
(define FAHR_CONST2 (/ 5 9))

(define-struct pair [num1 num2])
; (make-pair Number Number)
; Interp.: (make-pair n1 n2), a pair of two Numbers

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; [List-of USD] -> [List-of EUR]
; Converts a list of USD amounts to a list of EUR amounts
(check-expect (convert_to_euro '()) '())
(check-expect (convert_to_euro (list 10 20 30))
              (list (* USD_TO_EUR 10)
                    (* USD_TO_EUR 20)
                    (* USD_TO_EUR 30)))

(define (convert_to_euro lusd)
  (map
   (lambda (a_usd)
     (* USD_TO_EUR a_usd))
   lusd))

; [List-of TFahr] -> [List-of TCels]
; Converts a list of temperature readings in degrees Fahrenheit to
; a list of temperature readings in degrees Celsius
(check-expect (convertFC '()) '())
(check-expect (convertFC (list 212 428))
              (list 100 220))

(define (convertFC lf)
  (map
   (lambda (a_fahr)
     (* (- a_fahr FAHR_CONST1)
        FAHR_CONST2))
   lf))

; [List-of Posn] -> [List-of Pair]
; Converts a list of Posns to a list of Pairs
(check-expect (translate '()) '())
(check-expect (translate (list (make-posn 30 40)))
              (list (make-pair 30 40)))
(check-expect (translate (list (make-posn 20 80)
                               (make-posn 10 100)
                               (make-posn -45 37)))
              (list (make-pair 20 80)
                    (make-pair 10 100)
                    (make-pair -45 37)))

(define (translate lposn)
  (map
   (lambda (a_posn)
     (make-pair (posn-x a_posn) (posn-y a_posn)))
   lposn))
