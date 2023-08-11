#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 274. Use existing abstractions to define the prefixes and
suffixes functions from exercise 190. Ensure that they pass the same
tests as the original function.
|#

; [List-of 1String] -> [List-of [List-of 1String]]
; Generatets a list of all prefixes of list l
(check-expect (gen_prefixes '()) '())
(check-expect (gen_prefixes (list "a"))
              (list (list "a")))
(check-expect (gen_prefixes (list "a" "b"))
              (list (list "a")
                    (list "a" "b")))
(check-expect (gen_prefixes (list "a" "b" "c"))
              (list (list "a")
                    (list "a" "b")
                    (list "a" "b" "c")))

(define (gen_prefixes l) '())
