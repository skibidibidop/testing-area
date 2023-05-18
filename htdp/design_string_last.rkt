;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname design_string_last) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 18, 2023

Extract last character from non-empty string.
|#

; String -> 1String
; extract last 1String from given string
; given: "hello" expect: "o"
; given: "1hi!" expect: "!"
; given: "huh?2" expect: "2"
(define (string_last s)
  (string-ith s
              (- (string-length s) 1)))