;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname translate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 13, 2023

Input: posn list
Output: A posn list with each member translated to (make-posn x (+ y 1))
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; a posn_list is one of:
; - '()
; (cons posn posn_list)
; Interp.: a list of posns
; (define pl1 '())
; (define pl2 (cons (make-posn 1 2) '()))
; (define pl3 (cons (make-posn 3 4)
;                   (cons (make-posn 5 6) '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; posn_list -> posn_list
; Turns each member of input list to (make-posn x (+ y 1))
(check-expect (translate '()) '())
(check-expect (translate (cons (make-posn 1 2) '()))
              (cons (make-posn 1 3) '()))
(check-expect (translate (cons (make-posn 3 4)
                               (cons (make-posn 5 6) '())))
              (cons (make-posn 3 5)
                    (cons (make-posn 5 7) '())))

(define (translate plist)
  (cond[(empty? plist) '()]
       [else
        (cons (make-posn
               (posn-x (first plist))
               (+ (posn-y (first plist)) 1))
              (translate (rest plist)))]))