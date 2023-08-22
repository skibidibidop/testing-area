;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex_331) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 22, 2023

Exercise 331. Design the function how-many, which determines how
many files a given Dir.v1 contains. Remember to follow the design recipe;
exercise 330 provides you with data examples.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Dir.v1 is one of:
; '()
; (cons File.v1 Dir.v1)
; (cons Dir.v1 Dir.v1)

; A File.v1 is a String.

; An N is a Natural Number

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Dir.v1 -> N
; Returns the number of files in a given Dir.v1
(define (how-many dir) 0)