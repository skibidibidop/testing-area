;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_250) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 250. Design tabulate, which is the abstraction of the two
functions in figure 92. When tabulate is properly designed, use it to
define a tabulation function for sqr and tan.
|#

; Functions from figure 92:

; Number -> [List-of Number]
; tabulates sin between n
; and 0 (incl.) in a list
(define (tab-sin n)
  (cond
    [(= n 0) (list (sin 0))]
    [else
     (cons
      (sin n)
      (tab-sin (sub1 n)))]))

; Number -> [List-of Number]
; tabulates sqrt between n
; and 0 (incl.) in a list
(define (tab-sqrt n)
  (cond
    [(= n 0) (list (sqrt 0))]
    [else
     (cons
      (sqrt n)
      (tab-sqrt (sub1 n)))]))

; Abstraction:

