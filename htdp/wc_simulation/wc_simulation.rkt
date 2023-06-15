;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname wc_simulation) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 15, 2023

Counts the number of 1Strings, words, and lines in a file.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; A char_count is a Number
; Interp.: represents the number of 1Strings in a file

; A word_count is a Number
; Interp.: represents the number of words in a file

; A line_count is a Number
; Interp.: represents the number of lines in a file

(define-struct total [cc wc lc])
; total: (make-total Number Number Number)
; Interp.: contains the number of 1Strings (cc), words (wc), and lines (lc)
; in a file.

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; MAIN /////////////////////////////////////////////////////////////////////////