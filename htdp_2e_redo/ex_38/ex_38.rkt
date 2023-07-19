#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 38. Design the function string-remove-last, which produces a
string like the given one with the last character removed.
|#

(define START 0)

; String -> String
; Removes the last 1String from str
(check-expect (rm_last "hi!") "hi")
(check-expect (rm_last " ") "")
(check-expect (rm_last "hey") "he")

(define (rm_last str)
  (substring str START (- (string-length str) 1)))
