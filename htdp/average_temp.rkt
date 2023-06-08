;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname average_temp) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 8, 2023

Non-empty lists sample problem from the book.
|#

; A temp_list is one of:
; - '()
; - (cons ctemp temp_list)

; ctemp: a Number greater than -272

; temp_list -> Number
; Computes average temperature
(check-expect
 (average (cons 1 (cons 2 (cons 3 '())))) 2)

(define (average tlist) ...)