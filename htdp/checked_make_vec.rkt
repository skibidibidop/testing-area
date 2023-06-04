;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname checked_make_vec) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 4, 2023

A version of make-vec that only accepts positive numbers.
|#

(define-struct vec [x y])
; vec: (make-vec PositiveNumber PositiveNumber)
; Interp.: represents a velocity vector
#;
(define (fn_for_vec v)
  (...(vec-x v) (vec-y v)))

(define ERR_POS_ONLY ("Non-positive number received."))

; Number -> Number
; Creates an error if a number that is <= 0 is received.
(check-expect (pos_only 3) 3)
(check-expect (pos_only 0) ERR_POS_ONLY)
(check-expect (pos_only -3) ERR_POS_ONLY)

(define (pos_only n)
  (if (> n 0) n ERR_POS_ONLY))

; vec -> vec
; Outputs a vec if vec-x and vec-y are both positive numbers.
(check-expect (checked_make_vec
(define (checked_make_vec v)
  (make-vec (pos_only (vec-x v) (vec-y v))))