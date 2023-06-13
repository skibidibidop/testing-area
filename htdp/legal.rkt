;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname legal) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 13, 2023

Input: posn list
Output: posns with x-coordinates between 0-100 and y-coordinates between 0-200.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; A posn_list is one of:
; - '()
; - (cons posn posn_list)
; Interp.: a list of posns
; (define pl1 '())
; (define pl2 (cons (make-posn 1 2) '()))
; (define pl3 (cons (make-posn 3 4)
;                   (cons (make-posn 5 6) '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; posn_list -> posn_list
; Takes members of a posn_list with x-coordinates between 0-100 and
; y-coordinates between 0-200 and creates a new posn_list with that.
(check-expect (legal '()) '())
(check-expect (legal (cons (make-posn -1 -1) '())) '())
(check-expect (legal (cons (make-posn -1 0))) '())
(check-expect (legal (cons (make-posn 0 -1))) '())
(check-expect (legal (cons (make-posn 0 0) '()))
              (cons (make-posn 0 0) '()))
(check-expect (legal (cons (make-posn 100 200) '()))
              (cons (make-posn 100 200) '()))
(check-expect (legal (cons (make-posn 101 200) '())) '())
(check-expect (legal (cons (make-posn 100 201) '())) '())
(check-expect (legal
               (cons (make-posn 0 0)
                     (cons (make-posn 100 200) '())))
              (cons (make-posn 0 0)
                    (cons (make-posn 100 200) '())))
(check-expect (legal
               (cons (make-posn 0 0)
                     (cons (make-posn -1 200) '())))
              (cons (make-posn 0 0) '()))
(check-expect (legal
               (cons (make-posn 0 0)
                     (cons (make-posn 100 -1) '())))
              (cons (make-posn 0 0) '()))
(check-expect (legal
               (cons (make-posn 0 0)
                     (cons (make-posn 101 200) '())))
              (cons (make-posn 0 0) '()))
(check-expect (legal
               (cons (make-posn 0 0)
                     (cons (make-posn 100 201) '())))
              (cons (make-posn 0 0) '()))
(check-expect (legal
               (cons (make-posn 100 201)
                     (cons (make-posn -1 -5)
                           (cons (make-posn -5 300) '()))))
              '())

(define (legal plist) '())