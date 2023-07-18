;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex_14) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 14.
|#

; String -> 1String
; Extracts the last 1String from a non-empty string.
(check-expect (string_last "") "Empty string!")
(check-expect (string_last "Hey!") "!")
(check-expect (string_last " huh ") " ")

(define (string_last str)
  (cond
    [(string=? str "") "Empty string!"]
    [else
     (string-ith str (- (string-length str) 1))]))