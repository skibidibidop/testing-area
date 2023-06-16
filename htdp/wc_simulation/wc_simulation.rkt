#|
Author: Mark Beltran
Date: June 15, 2023

Counts the number of 1Strings, words, and lines in a file.
|#

(require 2htdp/batch-io)

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

; A char_list is one of:
; - '()
; - (cons char char_list)
; Interp.: a list of characters in the order they appear in the file
(define cl1 '())
(define cl2 (cons "a" '()))
(define cl3 (cons "a"
                  (cons "b" '())))

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
(define lsl2 (cons (cons "sla" '()) '()))
(define lsl3 (cons
              (cons "sla" '())
              (cons
               (cons "slb" '())
               '())))

; FUNCTIONS, ETC. /////////////////////////////////////////////////////////

(define tracker (make-total 0 0 0))

; lsl -> total
; Stores the char_count, word_cout, and line_count of a file in a total
(check-expect (counter '()) (make-total 0 0 0))
(check-expect (counter (cons
                        (cons "lsla" '()) '()))
              (make-total 4 1 1))
(check-expect (counter
               (cons
                (cons "lsla"
                      (cons "lslb" '()))
                '()))
              (make-total 9 2 1))
(check-expect (counter
               (cons
                (cons "lsla"
                      (cons "lslb" '()))
                (cons
                 (cons "lslc"
                       (cons "lsld"
                             (cons "lsle" '())))
                 '())))
               (make-total 23 5 2))

(define (master_counter in_lsl) ...)

; MAIN /////////////////////////////////////////////////////////////////////////

(define (main filename)
  (master_counter (read-words/line filename)))
