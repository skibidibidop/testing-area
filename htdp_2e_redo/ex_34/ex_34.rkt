#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 34.

Design the function string-first, which extracts the
first character from a non-empty string. Don’t worry about empty strings.
|#

; String -> 1String
; Extracts the first character from a non-empty string.
(check-expect (string_first "hi") "h")
(check-expect (string_first " ") " ")
(check-expect (string_first "?que?") "?")

(define (string_first str)
  (string-ith str 0))
