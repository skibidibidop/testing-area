;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex_18) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 18.
|#

; String String -> String
; Combines 2 strings with _ in between
(check-expect (str_join "hey" "there") "hey_there")
(check-expect (str_join "" "huh") "_huh")
(check-expect (str_join "huh" "") "huh_")
(check-expect (str_join "test" " ") "test_ ")

(define (str_join left right)
  (string-append left "_" right))