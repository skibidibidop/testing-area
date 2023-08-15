;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ca_19_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Date: August 15, 2023

Code-along
19.2 Forests
Sample Problem
Design the function blue-eyed-child-in-forest?, which determines whether a
family forest contains a child with "blue" in the eyes field.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct no-parent [])

(define NP (make-no-parent))

(define-struct child [father mother name date eyes])
; An FT (short for Family Tree) is one of:
; NP
; (make-child FT FT String N String)

; An FF (short for Family Forest) is one of:
; '()
; (cons FT FF)
; Interp.: a family forest represents several families and their
; ancestor trees

(define ff1 (list Carl Bettina))
(define ff2 (list Fred Eva))
(define ff3 (list Fred Eva Carl))

; FUNCTIONS ////////////////////////////////////////////////////////////////////