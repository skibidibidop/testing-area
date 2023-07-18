;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex_15) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 15.
|#

; Boolean Boolean -> Boolean
; True if sunny is false or friday is true
(check-expect (sorf #true #true) #true)
(check-expect (sorf #true #false) #false)
(check-expect (sorf #false #false) #true)
(check-expect (sorf #false #true) #true)

(define (sorf sunny friday)
  (or (not sunny) friday))