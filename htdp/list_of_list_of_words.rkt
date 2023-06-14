;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname list_of_list_of_words) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 14, 2023

Code-along 10.3 Lists in lists, files
|#

(require 2htdp/batch-io)

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; A string_list is one of:
; '()
; (cons String string_list)
; Interp.: a list of strings
; (define sl1 '())
; (define sl2 (cons "String1" '()))
; (define sl3 (cons "String1" (cons "String2" '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////