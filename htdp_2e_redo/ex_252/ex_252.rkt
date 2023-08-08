;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_252) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 252. Design fold2, which is the abstraction of the two func-
tions in figure 94. Compare this exercise with exercise 251. Even though
both involve the product function, this exercise poses an additional chal-
lenge because the second function, image*, consumes a list of Posns and
produces an Image. Still, the solution is within reach of the material in
this section, and it is especially worth comparing the solution with the one
to the preceding exercise. The comparison yields interesting insights into
abstract signatures.
|#

(require 2htdp/image)

; graphical constants:
(define emt
  (empty-scene 100 100))
(define dot
  (circle 3 "solid" "red"))

; Functions from figure 94:

; [List-of Number] -> Number
(define (product l)
  (cond
    [(empty? l) 1]
    [else
     (* (first l)
        (product
         (rest l)))]))

; [List-of Posn] -> Image
(define (image* l)
  (cond
    [(empty? l) emt]
    [else
     (place-dot
      (first l)
      (image* (rest l)))]))

; Aux for (image*):
; Posn Image -> Image
(define (place-dot p img)
  (place-image
   dot
   (posn-x p) (posn-y p)
   img))

; (X -> Y) [List-of X] Y -> Y
(define (fold2 op l base)
  (cond
    [(empty? l) base]
    [else
     (op (first l)
         (fold2 op (rest l) base))]))
