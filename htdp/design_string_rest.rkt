;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname design_string_rest) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 18, 2023

Print given string with first character removed.
|#

; String -> String
; print given string without first character
; given: "Hi there!"
; expected: "i there!"
(define (string_rest s)
  (substring s
             1
             (string-length s)))
                  