#|
Author: Mark Beltran
Date: June 15, 2023

Counts the number of 1Strings, words, and lines in a file.
|#

(require 2htdp/batch-io)

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

(define-struct total [cc wc lc])
; total: (make-total Number Number Number)
; Interp.: contains the number of 1Strings (cc), words (wc), and lines (lc)
; in a file.
; (define tot1 (make-total 3 10 4))

; FUNCTIONS, ETC. /////////////////////////////////////////////////////////

; lsl -> total
; Stores the character count, word count, and line count in a total
(check-expect (counter "ttt.txt") (make-total 183 33 13))

(define (counter filename)
  (make-total (length (read-1strings filename))
              (length (read-words filename))
              (length (read-lines filename))))
