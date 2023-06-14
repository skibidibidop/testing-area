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
; - '()
; - (cons String string_list)
; Interp.: a list of strings
; (define sl1 '())
; (define sl2 (cons "String1" '()))
; (define sl3 (cons "String1" (cons "String2" '())))

; A list_of_string_lists is one of:
; - '()
; - (cons string_list list_of_string_lists)
; Interp. list of list of strings
; (define lsl1 '())
; (define lsl2 (cons
;               (cons "String1" '()) '()))
; (define lsl3 (cons
;               (cons "String1"
;                     (cons "String2" '())) '()))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; String -> String
; Produces file content as a string.
(check-expect (read_file "ttt.txt")
              (+ "TTT\n"
                 "\nPut up in a place\n"
                 "where it's easy to see\n"
                 "the cryptic admonishment\n"
                 "T.T.T.\n"
                 "\nWhen you feel how depressingly\n"
                 "slowly you climb,\n"
                 "it's well to remember that\n"
                 "Thing Take Time.\n"
                 "\nPiet Hein"))

(define (read_file f) ...)

; String -> string_list
; Produces file content as a list of strings, one per line
(define (read_lines f) ...)

; String -> string_list
; Produces file content as a list of strings, one per word
(define (read_words f) ...)

; String -> list_of_string_lists
; Produces file content as list of string_lists, one list per line and
; one string per word
(define (read_words_lines f) ...)