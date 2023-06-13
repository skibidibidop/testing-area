;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname posnx_sum) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 13, 2023

Output the sum of all x-coordinates in a posn list.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; a posn_list is one of:
; - '()
; - (cons posn posn_list)
; Interp.: a list of posns
; (define pl1 '())
; (define pl2 (cons (make-posn 3 4) '()))
; (define pl3 (cons (make-posn 5 6)
;                   (cons (make-posn 7 8) '())))

; FUNCTIOIN DEFINITIONS ////////////////////////////////////////////////////////

; posn_list -> Number
; Produces the sum of all x-coordinates in a posn list.
(check-expect (x_sum '()) 0)
(check-expect (x_sum (cons (make-posn 1 2) '())) 1)
(check-expect (x_sum (cons
                      (make-posn 3 4)
                      (cons (make-posn 5 6) '()))) 8)

(define (x_sum plist)
  (cond[(empty? plist) 0]
       [else
        (+ (posn-x (first plist))
           (x_sum (rest plist)))]))