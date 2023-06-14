#|
Author: Mark Beltran
Date: June 15, 2023

Removes all articles ("a", "an", "the") from a text file.

Input: <file name>.txt
Output: no_articles_<file name>.txt
|#

(require 2htdp/batch-io)

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

; lsl -> String
; Converts provided lsl to String
(check-expect (lsl_to_str '()) "")
(check-expect (lsl_to_str
               (cons
                (cons "lsla" '()) '()))
              "lsla")
(check-expect (lsl_to_str
               (cons
                (cons "lsla"
                      (cons "lslb" '()))
                (cons
                 (cons "lslc" '())
                 '())))
              "lsla lslb\nlslc")

(define (lsl_to_str in_lsl)
  (cond[(empty? in_lsl) ""]
       [else
        (string-append
         (sl_to_str (first in_lsl))
         (cond[(empty? (rest in_lsl))
               ""]
              [else "\n"])
         (lsl_to_str (rest in_lsl)))]))

; string_list -> String
; Converts a string_list to String
(check-expect (sl_to_str '()) "")
(check-expect (sl_to_str
               (cons "hi" '()))
              "hi")
(check-expect (sl_to_str
               (cons "hello"
                     (cons "there" '())))
              "hello there")

(define (sl_to_str in_sl)
  (cond[(empty? in_sl) ""]
       [else
        (string-append
         (del_article (first in_sl))
         (cond[(empty? (rest in_sl))
               ""]
              [else " "])
         (sl_to_str (rest in_sl)))]))

; String -> String
; Replaces articles with ""
(check-expect (del_article "a") "")
(check-expect (del_article "A") "")
(check-expect (del_article "an") "")
(check-expect (del_article "An") "")
(check-expect (del_article "AN") "")
(check-expect (del_article "the") "")
(check-expect (del_article "The") "")
(check-expect (del_article "THE") "")
(check-expect (del_article "we") "we")

(define (del_article str)
  (cond[(or (string=?
             (string-downcase str) "a")
            (string=?
             (string-downcase str) "an")
            (string=?
             (string-downcase str) "the"))
        ""]
       [else str]))

; MAIN /////////////////////////////////////////////////////////////////////////

(define (main filename)
  (write-file
   (string-append "no_articles_" filename)
   (lsl_to_str (read-words/line filename))))