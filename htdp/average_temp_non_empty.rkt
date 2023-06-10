;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname average_temp_non_empty) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 10, 2023

Computes the average of all Celsius temperatures in a non-empty list.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; a cels_temp is a Number greater than -272
; Interp.: represents temperature in Celsius

; a non_empty_list is one of:
; - (cons cels_temp '())
; - (cons cels_temp non_empty_list)
; Interp.: non-empty list of temperatures in Celsius
; (define nl1 (cons -271 '()))
; (define nl2 (cons 0 (cons 50 '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; non_empty_list -> Number
; Returns count of list members
(define (how_many nlist) 1)

; non_empty_list -> Number
; Returns sum of list members
(define (sum nlist) 3)

; non_empty_list -> Number
; Returns average of list members
(define (average nlist) 10)