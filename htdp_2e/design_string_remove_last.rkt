;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname design_string_remove_last) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 18, 2023

Print given string without last character.
|#

; String -> String
; print given string without last character
; given: "Hi there!"
; expected: "Hi there"
(define (string_remove_last s)
  (substring s
             0
             (- (string-length s) 1)))