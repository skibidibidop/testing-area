;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_239) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 12, 2023

Exercise 239
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A [List X Y] is a structure:
; (cons X (cons Y '()))

; A [List Number Number] is a structure:
; (cons Number (cons Number '()))
(define le_num_num (list 1 2))

; A [List Number 1String] is a structure:
; (cons Number (cons 1String '()))
(define le_num_str (list 1 "hi"))

; A [List String Boolean] is a structure:
; (cons String (cons Boolean '()))
(define le_str_bool (list "hi" #false))

; FUNCTIONS ////////////////////////////////////////////////////////////////////