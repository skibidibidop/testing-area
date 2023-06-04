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

(define ERR_POS_ONLY "Non-positive number received.")

; Number -> Number
; Creates an error if a number that is <= 0 is received.
(define (pos_only n)
  (cond[(positive? n) n]
       [else (error ERR_POS_ONLY)]))

; vec -> vec
; Outputs a vec if vec-x and vec-y are both positive numbers.
(define (checked_make_vec v)
  (make-vec (pos_only (vec-x v)) (pos_only (vec-y v))))