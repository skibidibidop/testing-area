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
; (define tot1 (make-total 3 10 4))

; A string_list is one of:
; - '()
; - (cons String string_list)
; Interp.: each list member represents a word, each list represents a line in
; the file
(define sl1 '())
(define sl2 (cons "sla" '()))
(define sl3 (cons "sla"
                  (cons "slb" '())))

; An lsl (short for list of string_lists)

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////



; MAIN /////////////////////////////////////////////////////////////////////////
