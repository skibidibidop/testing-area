#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 267. Use map to define the function convert-euro, which converts a
list of US$ amounts into a list of e amounts based on an exchange rate of
USD 1.06 per EUR (on April 13, 2017).

Also use map to define convertFC, which converts a list of Fahrenheit
measurements to a list of Celsius measurements.

Finally, try your hand at translate, a function that translates a list of
Posns into a list of lists of pairs of numbers.
|#

(define USD_PER_EUR 1.06)
(define FAHR_CONST1 32)
(define FAHR_CONST2 (/ 5 9))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A USD is a Number representing an amount of money in US Dollars.

; An EUR is a Number representing an amoutn of money in Euros.

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; [List-of USD] -> [List-of EUR]
; Converts a list of USD amounts to a list of EUR amounts
(check-expect (convert_to_eur '()) '())
(check-expect (convert_to_eur (list 3 10 100))
              (list (* 3   USD_PER_EUR)
                    (* 10  USD_PER_EUR)
                    (* 100 USD_PER_EUR)))

(define (convert_to_eur lusd)
  (local
    [(define (convert usd)
       (* USD_PER_EUR usd))]
    (map convert lusd)))

; [List-of TFahr] -> [List-of TCels]
; Converts a list of temperature readings in Fahrenheit to Celsius
(check-expect (convertFC '()) '())
(check-expect (convertFC (list 32 212 392))
              (list 0 100 200))

(define (convertFC ltf)
  (local
    [(define (convert tf)
       (* (- tf FAHR_CONST1)
          FAHR_CONST2))]
    (map convert ltf)))
