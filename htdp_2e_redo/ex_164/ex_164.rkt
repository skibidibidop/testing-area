#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 164. Design the function convert-euro, which converts a
list of US$ amounts into a list of Euro amounts. Look up the current exchange
rate on the web.

Generalize convert-euro to the function convert-euro*, which
consumes an exchange rate and a list of US$ amounts and converts the
latter into a list of Euro amounts.
|#

(define USD_EUR 0.91)

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A List-of-USD is one of:
; '()
; (cons USD List-of-USD)
; Interp.: list of US Dollar amounts

; A List-of-EUR is one of:
; '()
; (cons EUR List-of-EUR)
; Interp.: list of Euro amounts

; A USD is a Number
; Interp.: represents an amount in US Dollars

; A EUR is a Number
; Interp.: represents an amount in Euros

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; List-of-USD -> List-of-EUR
; Converts a list of USD amounts to a list of EUR amounts
(check-expect (convert-euro '()) '())
(check-within (convert-euro (list 1)) (list (* 1 USD_EUR)) 0.1)
(check-within (convert-euro (list 30 500))
              (list (* 30 USD_EUR) (* 500 USD_EUR))
              0.001)

(define (convert-euro lusd)
  (cond
    [(empty? lusd) '()]
    [else
     (cons (* (first lusd) USD_EUR)
           (convert-euro (rest lusd)))]))

; Number List-of-USD -> List-of-EUR
; Converts a list of USD to a list of EUR amounts based on the provided
; exchange rate xrate
(check-expect (convert-euro* 0.97 '()) '())
(check-within (convert-euro* 0.97 (list 10)) (list (* 10 0.97)) 0.001)
(check-within (convert-euro* 0.97 (list 100 200))
              (list (* 100 0.97) (* 200 0.97)) 0.001)

(define (convert-euro* xrate lusd)
  (cond
    [(empty? lusd) '()]
    [else
     (cons (* xrate (first lusd))
           (convert-euro* xrate (rest lusd)))]))
  
