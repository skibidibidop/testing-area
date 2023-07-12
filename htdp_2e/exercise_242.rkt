;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_242) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; String 