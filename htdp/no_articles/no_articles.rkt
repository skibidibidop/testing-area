#|
Author: Mark Beltran
Date: June 15, 2023

Removes all articles ("a", "an", "the") from a text file.

Input: <file name>.txt
Output: no_articles_<file name>.txt
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; A string_list is one of:
; - '()
; - (cons String string_list)
; Interp.: a list of strings which represents a line in the file
(define sl1 '())
(define sl2 (cons "sla" '()))
(define sl3 (cons "sla"
                  (cons "slb" '())))

; A lsl (short for list of string_lists) is one of:
; - '()
; (cons string_list lsl)
; Interp.: a list of string_lists, represents how the lines are organized
; in the file
(define lsl1 '())
(define lsl2 (cons (cons "sla" '()) '()))
(define lsl3 (cons
              (cons "sla" '())
              (cons
               (cons "slb" '())
               '())))
(define lsl4 (cons
              (cons "sla"
                    (cons "slb"
                          (cons "slc" '())))
              (cons
               (cons "sld"
                     (cons "sle" '()))
               (cons
                (cons "slf" '())
                '()))))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////
