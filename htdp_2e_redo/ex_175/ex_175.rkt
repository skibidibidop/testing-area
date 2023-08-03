;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_175) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 175. Design a BSL program that simulates the Unix command
wc. The purpose of the command is to count the number of 1Strings, words,
and lines in a given file. That is, the command consumes the name of a file
and produces a value that consists of three numbers.
|#

(require 2htdp/batch-io)

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

(define-struct total [cc wc lc])
; total: (make-total Number Number Number)
; Interp.: contains the number of 1Strings (cc), words (wc), and lines (lc)
; in a file.
; (define tot1 (make-total 3 10 4))

; FUNCTIONS, ETC. /////////////////////////////////////////////////////////

; lsl -> total
; Stores the character count, word count, and line count in a total
(check-expect (counter "ttt.txt") (make-total 183 33 13))

(define (counter filename)
  (make-total (length (read-1strings filename))
              (length (read-words filename))
              (length (read-lines filename))))