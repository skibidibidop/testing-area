#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 134. Develop the contains? function, which determines whether
some given string occurs on a given list of strings.
|#

; A String_list is one of:
; '()
; (cons String String_list)

; String -> String_list
; Checks if String s is in String_list sl
(check-expect (contains? "a" (list "a" "b" "c")) #true)
(check-expect (contains? "a" (list "ab" "bc" "ad")) #false)
(check-expect (contains? "a" (list "b" "c" "d")) #false)

(define (contains? s sl)
  (cond
    [(empty? sl) #false]
    [else
     (or (string=? s (first sl))
         (contains? s (rest sl)))]))
