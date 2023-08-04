#|
Author: Mark Beltran
Date: August 4, 2023

Exercise 190. Design the prefixes function, which consumes a list of
1Strings and produces the list of all prefixes. A list p is a prefix of
l if p and l are the same up through all items in p. For example, (list "a" "b"
"c") is a prefix of itself and (list "a" "b" "c" "d").

Design the function suffixes, which consumes a list of 1Strings and
produces all suffixes. A list s is a suffix of l if p and l are the same from
the end, up through all items in s. For example, (list "b" "c" "d") is
a suffix of itself and (list "a" "b" "c" "d").
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Prefix is one of:
; '()
; (cons 1String Prefix)
; Interp.: a list of 1Strings

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Prefix -> List-of-prefix
; Generates a list of all Prefixes from Prefix l
(check-expect (prefix '()) '())
(check-expect (prefix (list "q")) (list "q"))
(check-expect (prefix (list "q" "w"))
              (list (list "q")
                    (list "q" "w")))
(check-expect (prefix (list "q" "w" "e"))
              (list (list "q")
                    (list "q" "w")
                    (list "q" "w" "e")))

(define (prefix l) '())
