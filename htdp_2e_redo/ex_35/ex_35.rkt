#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 35.

Design the function string-last, which extracts the last
character from a non-empty string.
|#

; String -> 1String
; Extracts the last character from a non-empty string.
(check-expect (string_last "hi") "i")
(check-expect (string_last " ") " ")
(check-expect (string_last "?que?") "?")

(define (string_last str)
  (string-ith str (- (string-length str) 1)))
