;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname collapse) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 14, 2023

Input: a .txt file with words/content

Using (collapse), convert the content of the .txt file to
a list of string lists (a string list represents a line in the
.txt file.

Output: a .dat file with content identical to that of the .txt file

Using

(write-file "nam.dat"
            (collapse (read-words/line "nam.txt")))

Convert list of string lists to string and write to .dat file
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; A string_list is one of:
; - '()
; - (cons String string_list)
; Interp.: represents a line in the file
(define sl1 '())
(define sl2 (cons "hello!" '()))
(define sl3 (cons "hello"
                  (cons "there!" '())))

; A lsl (short for list of string_list) is one of:
; - '()
; - (cons string_list lsl)
; Interp.: a list of string_lists
(define lsl1 '())
(define lsl2 (cons
              (cons "sla" '())
              '()))
(define lsl3 (cons
              (cons "sla"
                    (cons "slb"
                          (cons "slc" '())))
              (cons
               (cons "sld"
                     (cons "sle" '()))
               '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////