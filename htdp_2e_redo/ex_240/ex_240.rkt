;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_240) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 7, 2023

Exercise 240. Here are two strange but similar data definitions:

; An LStr is one of:
; -- String
; -- (make-layer LStr)

; An LNum is one of:
; -- Number
; -- (make-layer LNum)

Both data definitions rely on this structure-type definition:

(define-struct layer [stuff])

Both define nested forms of data: one is about numbers and the other about
strings. Make examples for both. Abstract over the two. Then instantiate
the abstract definition to get back the originals.
|#

(define-struct layer [stuff])

