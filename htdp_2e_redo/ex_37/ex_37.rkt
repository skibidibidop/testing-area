#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 37. Design the function string-rest, which produces a
string like the given one with the first character removed.
|#

(define SECOND_1STRING 1)

; String -> String
; Removes the first 1String from a str
(check-expect (string_rest "hi") "i")
(check-expect (string_rest " ") "")
(check-expect (string_rest "!hi") "hi")

(define (string_rest str)
  (substring str SECOND_1STRING))
