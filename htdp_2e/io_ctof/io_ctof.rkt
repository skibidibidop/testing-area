;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname io_ctof) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 16, 2023

Read Celsius values from 1 file.
Convert to Fahrenheit.
Write converted value to another file.
|#

(require 2htdp/batch-io)

; Constants in the C to F conversion formula
(define F_CONST32 32.0)
(define F_CONSTFRAC 9/5)

; Convert Celsius to Fahrenheit
(define (ctof c)
  (+ F_CONST32
     (* c F_CONSTFRAC)))

; Read C from input, convert to F, write to output
(define (convert in out)
  (write-file out
              (string-append
               (number->string-digits
                (ctof
                 (string->number
                  (read-file in)))
                2)
               "\n")))