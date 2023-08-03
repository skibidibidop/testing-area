;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_172) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 172. Design the function collapse, which converts a list of
lines into a string. The strings should be separated by blank spaces (" ").
The lines should be separated with a newline ("\n").

Challenge
When you are finished, use the program like this:
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

; lsl -> String
; Converts a list of string_lists (aka list of lines) into a String
(check-expect (collapse '()) "")
(check-expect (collapse
               (cons
                (cons "hi" '()) '()))
              "hi")
(check-expect (collapse
               (cons
                (cons "hello"
                      (cons "there!" '())) '()))
              "hello there!")
(check-expect (collapse
               (cons
                (cons "this"
                      (cons "is"
                            (cons "a" '())))
                (cons
                 (cons "string"
                       (cons "with" '()))
                 (cons
                  (cons "multiple"
                        (cons "lines" '()))
                  '()))))
              "this is a\nstring with\nmultiple lines")

(define (collapse in)
  (cond[(empty? in) ""]
       [else
        (string-append
         (line_cat (first in))
         (cond[(not
                (empty? (rest in)))
               "\n"]
              [else ""])
         (collapse (rest in)))]))

; string_list -> String
; Converts a string_list to a String with words separated by blank spaces
(check-expect (line_cat '()) "")
(check-expect (line_cat
               (cons "sla" '()))
              "sla")
(check-expect (line_cat
               (cons "sla"
                     (cons "slb" '())))
              "sla slb")

(define (line_cat line)
  (cond[(empty? line) ""]
       [else
        (string-append
         (first line)
         (cond[(not
                (empty? (rest line)))
               " "]
              [else ""])
         (line_cat (rest line)))]))

; MAIN /////////////////////////////////////////////////////////////////////////

(write-file "ttt.dat"
            (collapse (read-words/line "ttt.txt")))