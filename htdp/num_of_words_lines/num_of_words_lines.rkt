;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname num_of_words_lines) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 14, 2023

Code-along: 10.3 Sample: number of lines and number of words per line
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; A string_list is one of:
; - '()
; - (cons String string_list)
; Interp.: a list of strings
; (define sl1 '())
; (define sl2 (cons "String1" '()))
; (define sl3 (cons "String2"
;                   (cons "String3" '())))


; An lsl (short for list of string_lists)
; - '()
; - (cons string_list lsl)
; Interp.: a list of string lists
; (define lsl1 '())
; (define lsl2 (cons
;               (cons "String1" '()) '()))
; (define lsl3 (cons
;               (cons "String2"
;                     (cons "String3" '())) '()))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; lsl -> string_list
; Determines the number of words on each line
(define (words_per_line lsl) '())