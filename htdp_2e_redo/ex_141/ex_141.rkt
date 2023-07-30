#|
Author: Mark Beltran
Date: July 30, 2023

Exercise 141. If you are asked to design the function cat, which consumes
a list of strings and appends them all into one long string, you are
guaranteed to end up with this partial definition:

; List-of-string -> String
; concatenates all strings in l into one long string
(check-expect (cat '()) "")
(check-expect (cat (cons "a" (cons "b" '()))) "ab")
(check-expect
 (cat (cons "ab" (cons "cd" (cons "ef" '()))))
 "abcdef")

(define (cat l)
  (cond
    [(empty? l) ""]
    [else (... (first l) ... (cat (rest l)) ...)]))

Fill in the table in figure 57. Guess a function that can create the desired
result from the values computed by the sub-expressions.

Use DrRacket’s stepper to evaluate (cat (cons "a" '()))
|#

#|
(cons "a" (cons "b" '()))

(first l) : "a"
(rest l) : (cons "b" '())
(cat (rest l)) : "b"
(cat l) "ab"

(cons "ab" (cons "cd" (cons "ef" '())))

(first l) : "ab"
(rest l) : (cons "cd" (cons "ef" '()))
(cat (rest l)) : "cdef"
(cat l : "abcdef"
|#

