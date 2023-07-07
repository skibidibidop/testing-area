;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname contains) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 6, 2023

contains? function: takes a string and a list of strings as arguments
and checks if the former is in the latter.
|#

; a string_list is one of:
; - '()
; - (cons String string_list)
; Interp.: a list of strings
; (define sl1 (cons "Str1" '()))
; (define sl2 (cons "Str1" (cons "Str2" '())))

; String string_list -> Boolean
; Checks if String is in string_list.
(check-expect (contains? "Sample1" (cons "Sample1" (cons "S2" '()))) #true)
(check-expect (contains? "Sample1" (cons "S2" (cons "S3" '()))) #false)
(check-expect (contains? "Sample1" (cons '() '())) #false)
(check-expect (contains? "Sample1" (cons "S2" (cons "Sample1" '()))) #true)

(define (contains? str strlist)
  (cond[(empty? strlist) #false]
       [(cons? strlist)
        (and (not (empty? (first strlist)))
             (or (string=? str (first strlist))
                 (contains? str (rest strlist))))]
       [else #false]))