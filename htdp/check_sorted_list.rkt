;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname check_sorted_list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 9, 2023

Check if a non-empty list is sorted in descending order.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; a cels is a Number > -272
; Interp.: represents temperature in Celsius
; (define c1 -271)
; (define c2 0)
; (define c3 1000)

; a non_empty_list is one of:
; - (cons cels '())
; - (cons cels non_empty_list)
; Interp.: non-empty list of Celsius temperatures
; (define nl1 (cons 30 '()))
; (define nl2 (cons -54 (cons 0 (cons 38 '()))))

; FUNCTION DEFINITION //////////////////////////////////////////////////////////

; non_empty_list -> Boolean
; Returns #true if list is in descending order. Otherwise, returns #false.
(check-expect (sorted>? (cons 50 (cons 0 (cons -100 '())))) #true)
(check-expect (sorted>? (cons -100 (cons 0 (cons 50 '())))) #false)
                         
(define (sorted>? nlist)
  (cond[(empty? (rest nlist)) (first nlist)]
       [else (< (first nlist) (sorted>? (rest nlist)))]))