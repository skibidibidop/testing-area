;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname design_string_first) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 18, 2023

Extract the first character from non-empty string.
|#

; String -> 1String
; extracts the first character from the given string
; given: "hello!" expect: "h"
; given: "1test?" expect "1"
(define (string_first s)
  (string-ith s 0))