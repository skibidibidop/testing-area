;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_240) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 12, 2023

Exercise 240
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

(define-struct layer [stuff])
; (make-layer Any)

; An LStr is one of:
; - String
; - (make-layer LStr)
(define lstr_samp1 "hi!")
(define lstr_samp2 (make-layer "hello"))

; An LNum is one of:
; - Number
; - (make-layer LNum)
(define lnum_samp1 2)
(define lnum_samp2 (make-layer 4))

; A [CL X] is one of:
; - X
; - (make-layer X)

; A [CL String] is one of:
; - String
; - (make-layer String)

; A [CL Number] is one of:
; - Number
; - (make-layer Number)