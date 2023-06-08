;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname checked_sum) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 6, 2023

Design function pos? to check if all numbers in a list are positive.
Design checked_sum which signals an error if a number in a provided list is not
positive. If all numbers in the list are positive, it provides the sum.
|#

; A num_list is one of:
; - '()
; - (cons Number num_list)
; Interp.: a list of numbers
; (define nl1 (cons 1 '()))
; (define nl2 (cons 5 (cons 3 '())))

; Number -> Boolean
; Returrns #true if Number is > 0. Otherwise, returns #false
(check-expect (pos? 1) #true)
(check-expect (pos? 1000) #true)
(check-expect (pos? 0) #false)
(check-expect (pos? -4) #false)

(define (pos? num)
  (> num 0))

(define ERR_NOT_POSITIVE "There is a non-positive in the list.")

; num_list -> Number
; Provides sum if list only has positive numbers. Otherwise, signals an error.
(check-expect (checked_sum (cons 3 (cons 2 '()))) 5)
(check-error (checked_sum (cons 0 (cons 1 '()))) ERR_NOT_POSITIVE)
(check-expect (checked_sum '()) 0)
(check-error (checked_sum (cons -4 (cons 3 '()))) ERR_NOT_POSITIVE)

(define (checked_sum nlist)
  (cond [(empty? nlist) 0]
        [(pos? (first nlist))
         (+ (first nlist) (checked_sum (rest nlist)))]
        [else (error ERR_NOT_POSITIVE)]))