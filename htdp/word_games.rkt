;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname word_games) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 23, 2023

Project: Word Games
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A String_list is one of:
; - '()
; - (cons String String_list)
; Interp.: a list of strings
(define sl1 '())
(define sl2 (cons "hi" (cons "hello" '())))

; FUNCTIONS ////////////////////////////////////////////////////////////////////