;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex_13) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 13.
|#

; String -> 1String
; Extracts the first 1String from a non-empty string.
(check-expect (string_first "") "Please input non-empty string.")
(check-expect (string_first "hello!") "h")
(check-expect (string_first " hi") " ")

(define (string_first str)
  (cond
    [(string=? str "") "Please input non-empty string."]
    [else
     (string-ith str 0)]))