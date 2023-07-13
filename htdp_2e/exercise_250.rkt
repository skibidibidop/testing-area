;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_250) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 13, 2023

Exercise 250
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////



; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Number -> [List_of Number]
; Tabulates sin between n and 0 (inclusive) in a list
(define (tab_sin n)
  (cond
    [(= n 0) (list (sin 0))]
    [else
     (cons (sin n)
           (tab_sin (sub1 n)))]))

; Number -> [List_of Number]
; Tabulates sqrt between n and 0 (inclusive) in a list
(define (tab_sqrt n)
  (cond
    [(= n 0) (list (sqrt 0))]
    [else
     (cons (sqrt n)
           (tab_sqrt (sub1 n)))]))