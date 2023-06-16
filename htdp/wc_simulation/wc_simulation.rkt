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

; An lsl (short for list of string_lists) is one of:
; - '()
; - (cons string_lists lsl)
; Interp.: each member represents a line in the file. An lsl represents how
; lines are organized in the file
(define lsl1 '())
(define lsl2 (cons
              (cons "sla" '())))
(define lsl3 (cons
              (cons "sla" '())
              (cons
               (cons "slb" '())
               '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; String -> total
; Counts the 1Strings, words, and lines in a file
(check-expect (main_counter "empty.txt") (make-total 0 0 0))
(check-expect (main_counter "c10w10line10.txt") (make-total 10 10 10))
(check-expect (main_counter "c10w1line1.txt") (make-total 10 1 1))
(check-expect (main_counter "c1w1line1.txt") (make-total 1 1 1))
(check-expect (main_counter "c25w5line4.txt") (make-total 25 5 4))
(check-expect (main_counter "newline.txt") (make-total 1 1 1))

(define (main_counter filename)
  (make-total 0 0 0))

; MAIN /////////////////////////////////////////////////////////////////////////