#|
Author: Mark Beltran
Date: May 21, 2023

Tax Land sample problem

< $1,000: no tax
$1,000 to $9,999: 5% tax
>= $10,000: 8% tax
|#

(require 2htdp/universe)

(define CHEAP_LIM 1000)
(define MID_LIM 9999)
(define LUXURY_START 10000)
(define FIVE_PCENT 0.05)
(define EIGHT_PCENT 0.08)

; A Price falls into on of these intervals:
; -- 0 through 999
; -- 1000 to 10000
; -- above 10000
; Interpretation: the price of an item

; Price -> Number
; Computes the tax for p
(check-expect (sales_tax 0) 0)
(check-expect (sales_tax 545) (* 0 545))
(check-expect (sales_tax 1000) (* 0.05 1000))
(check-expect (sales_tax 5689) (* 0.05 5689))
(check-expect (sales_tax 9999) (* 0.05 9999))
(check-expect (sales_tax 10000) (* 0.08 10000))
(check-expect (sales_tax 12341) (* 0.08 12341))
(define (sales_tax p)
  (cond[(< p CHEAP_LIM) 0]
       [(<= CHEAP_LIM p MID_LIM) (* FIVE_PCENT p)]
       [(>= p LUXURY_START) (* EIGHT_PCENT p)]))
