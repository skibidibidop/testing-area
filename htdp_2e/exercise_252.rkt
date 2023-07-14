;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_252) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 13, 2023

Exercise 252
|#

(require 2htdp/image)

(define EMT
  (empty-scene 100 100))
(define DOT
  (circle 3 "solid" "red"))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A [List_of ITEM] is one of:
; - '()
; - (cons ITEM [List_of ITEM])

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; [List_of Number] -> Number
(define (product l)
  (cond
    [(empty? l) 1]
    [else
     (* (first l)
        (product (rest l)))]))

; [List_of Posn] -> Image
(define (image* l)
 (cond
   [(empty? l) EMT]
   [else
    (place_dot
     (first l)
     (image* (rest l)))]))

; Posn Image -> Image
(define (place_dot p img)
  (place-image
   DOT
   (posn-x p) (pons-y p)
   img))

; 