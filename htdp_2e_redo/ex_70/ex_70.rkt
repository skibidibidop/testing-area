;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_70) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 70.
|#

; Exercise 70. Spell out the laws for these structure type definitions:
(define-struct centry [name home office cell])
(define-struct phone [area number])

(centry-name (make-centry n0 h0 o0 c0))
(centry-home (make-centry n0 h0 o0 c0))
(centry-office (make-centry n0 h0 o0 c0))
(centry-cell (make-centry n0 h0 o0 c0))

(phone-area (make-phone a0 n0))
(phone-number (make-phone a0 n0))