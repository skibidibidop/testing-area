;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ufo_tracking) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 22, 2023

Keep track of UFO moving across the canvas
at varying speed.
|#

(require 2htdp/image)
(require 2htdp/universe)

; A vel is a structure:
;    (make-vel deltax deltay)
; Interpretation: velocity, with deltax and deltay
; signifying direction and speed
; A negative y-coordinate means upward movement
(define-struct vel [deltax deltay])

; A ufo is a structure:
;    (make-ufo posn vel)
; Interpretation: ufo is currently located at posn
; moving at velocity v
(define-struct ufo [loc vel])

(define v1 (make-vel 8 -3))
(define v2 (make-vel -5 -3))

(define p1 (make-posn 22 80))
(define p2 (make-posn 30 77))

(define u1 (make-ufo p1 v1))
(define u2 (make-ufo p1 v2))
(define u3 (make-ufo p2 v1))
(define u4 (make-ufo p2 v2))

; posn vel -> posn
; Adds v to p
(check-expect (posn+ p1 v1) p2)
(check-expect (posn+ p1 v2) (make-posn 17 77))
(define (posn+ p v)
(make-posn (+ (posn-x p) (vel-deltax v))
           (+ (posn-y p) (vel-deltay v))))
; ufo -> ufo
; Determines where u moves in 1 tick
; Leaves the velocity as is
(check-expect (ufo-move-1 u1) u3)
(check-expect (ufo-move-1 u2)
              (make-ufo (make-posn 17 77) v2))
(define (ufo-move-1 u)
  (make-ufo (posn+ (ufo-loc u) (ufo-vel u))
            (ufo-vel u)))
