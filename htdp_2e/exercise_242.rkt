#|
Author: Mark Beltran
Date: July 12, 2023

Exercise 242
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A [Maybe X] is one of:
; - #false
; - X

; Interpret these:

; [Maybe String] is one of:
; - #false
; - String

; [Maybe [List_of String]] is one of:
; - #false
; - [List_of String]

; [List_of [Maybe String]] is one of:
; - '()
; - (cons [Maybe String] [List_of [Maybe String]])
; Either an empty list or a list of [Maybe String]

; What does the following signature mean?

; String [List_of String] -> [Maybe [List_of String]]
; Returns the remainder of [List_of String] lost starting with String s
; #false otherwise
(check-expect (occurs "a" (list "b" "a" "d" "e"))
              (list "d" "e"))
(check-expect (occurs "a" (list "b" "c" "d")) #false)

(define (occurs s los)
  los)
