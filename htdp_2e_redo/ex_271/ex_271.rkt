;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_271) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 271. Use ormap to define find-name. The function consumes
a name and a list of names. It determines whether any of the names on the
latter are equal to or an extension of the former.

With andmap you can define a function that checks all names on a list
of names that start with the letter "a".

Should you use ormap or andmap to define a function that ensures that
no name on some list exceeds a given width?
|#

; String [List-of String] -> Boolean
; Checks if (name) is a prefix of any of the names in (lonam)
(check-expect (find-name "a" '()) #false)
(check-expect (find-name "a" (list "baa" "cde")) #true)
(check-expect (find-name "ab" (list "abaa" "cdef")) #true)
(check-expect (find-name "abc" (list "abc" "def")) #true)
(check-expect (find-name "z" (list "abc" "def")) #false)

(define (find-name name lonam)
  (local
    [(define (match? name_from_list)
       (string-contains? name name_from_list))]
    (ormap match? lonam)))