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

; A num_list is one of:
; - '()
; - (cons Number num_list)
; Interp.: a list of numbers
; (define nl1 '())
; (define nl2 (cons 1 '()))
; (define nl3 (cons 2
;                   (cons 3 '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; lsl -> num_list
; Determines the number of words on each line
(check-expect (words_per_line '()) '())
(check-expect (words_per_line
               (cons (cons "String1" '()) '()))
              1)
(check-expect (words_per_line
               (cons
                (cons "String2"
                      (cons "String3" '()))
                '()))
              2)
(check-expect (words_per_line
               (cons
                (cons "String4"
                      (cons "String5" '()))
                (cons "String6"
                      (cons "String7" '()))))
              
(define (words_per_line lsl) '())