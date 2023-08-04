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

; Input
;  (list a b c)
; Reverse Prefix
;  (list c b a)
; Put in list, take rest recursively to generate List-of-prefix
;   (list (list c b a)
;         (list b a)
;         (list a))
; Reverse each Prefix in List-of-prefix
;   (list (list a b c)
;         (list a b)
;         (list a))
; Reverse the List-of-prefix
;   (list (list a)
;         (list a b)
;         (list a b c))

; Prefix -> List-of-prefix
; Generates a list of all Prefixes from Prefix l
(check-expect (prefixes '()) '())
(check-expect (prefixes (list "q")) (list (list "q")))
(check-expect (prefixes (list "q" "w"))
              (list (list "q")
                    (list "q" "w")))
(check-expect (prefixes (list "q" "w" "e"))
              (list (list "q")
                    (list "q" "w")
                    (list "q" "w" "e")))

(define (prefixes l)
  (reverse
   (get-prefixes
    (reverse l))))

; Prefix -> List-of-prefix
(define (get-prefixes l)
  (cond
    [(empty? l) '()]
    [else
     (cons (reverse l)
           (get-prefixes (rest l)))]))

; Input
;  (list a b c)
; Take rest recursively to generate List-of-suffix
;  (list (list a b c)
;        (list b c)
;        (list c))
;

; List-of-1String -> List-of-list-of-1String
; Generates a list of all suffixes from List-of-list-of-1String
(check-expect (suffixes '()) '())
(check-expect (suffixes (list "a")) (list (list "a")))
(check-expect (suffixes (list "a" "b" "c"))
              (list (list "a" "b" "c")
                    (list "b" "c")
                    (list "c")))

(define (suffixes l)
  (cond
    [(empty? l) '()]
    [else
     (cons l
           (suffixes (rest l)))]))
