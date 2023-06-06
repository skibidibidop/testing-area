;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sum_of_money) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 6, 2023

Compute sum of amounts in a list.
|#

; an amount_list is one of:
; - '()
; - (cons PositiveNumber amount_list)
; Interp.: a list of amounts of money
; (define al1 (cons 50 '()))
; (define al2 (cons 50 (cons 30 '())))

