;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex_337) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 23, 2023

Exercise 337. Use List-of to simplify the data definition Dir.v3. Then
use ISL+’s list-processing functions from figures 95 and 96 to simplify the
function definition(s) for the solution of exercise 336.
|#

; ORIGINAL DATA DEFINITION /////////////////////////////////////////////////////

(define-struct file [name size content])
; A File.v3 is a structure:
; (make-file String N String)

(define-struct dir.v3 [name dirs files])
; A Dir.v3 is a structrue:
; (make-dir.v3 String Dir* File*)

; A Dir* is one of:
; '()
; (cons Dir.v3 Dir*)

; A File* is one of:
; '()
; (cons File.v3 File*)

; DATA DEFINITION SIMPLIFICATION ///////////////////////////////////////////////

; A Dir* is a [List-of Dir.v3]
; A File* is a [List-of File.v3]

; FUNCTIONS ////////////////////////////////////////////////////////////////////