;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname structs_in_lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 12, 2023

Code-along: sample in 10.2 Structures in Lists
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

(define-struct work [emp rate hrs])
; (make-work String Number Number)
; Interp.: (make-work n r h) combines an employee's name (n), rate (r), and
; number of hours worked (h)

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////