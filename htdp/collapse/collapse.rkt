;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname collapse) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 14, 2023

(collapse): converts a list of lines into a string.
  Words are separated by blank spaces. Lines are separated
  by \n.

Use:

(write-file "ttt.dat"
            (collapse (read-words/line "ttt.txt")))
|#

(require 2htdp/batch-io)

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; A string_list is one of:
; - '()
; - (cons String string_list)
; - Interp.: a list of strings is a line
(define sl1 '())
(define sl2 (cons "sla" '()))
(define sle3 (cons "sla"
                   (cons "slb" '())))

; A lsl (short for list of string_lists) is one of:
; - '()
; - (cons string_list lsl)
; Interp.: a list of string_lists/lines
(define lsl1 '())
(define lsl2 (cons
              (cons "sla" '())
              '()))
(define lsl3 (cons
              (cons "sla"
                    (cons "slb" '()))
              (cons
               (cons "slc"
                     (cons "sld"
                           (cons "sle" '())))
               '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////