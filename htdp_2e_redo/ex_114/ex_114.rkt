#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 114. Use the predicates from exercise 113 to check the space
invader world program, the virtual pet program (exercise 106), and the
editor program (chapter 5.10).
|#

; A SIGS is one of:
; -- (make-aim UFO Tank)
; -- (make-fired UFO Tank Missile)
; interpretation represents the complete state of a
; space invader game

; A Coordinate is one of:
; -- a NegativeNumber
; interpretation on the y axis, distance from top
; -- a PositiveNumber
; interpretation on the x axis, distance from left
; -- a Posn
; interpretation an ordinary Cartesian point

; A VAnimal is either
; -- a VCat
; -- a VCham

(define-struct aim [ufo tank])

(define-struct fired [ufo tank missile])

(define-struct vcat [loc hap])

(define-struct vcham [loc hap col])

(define (sigs? s)
  (or (aim? s) (fired? s)))

(define (coordinate? c)
  (or (posn? c) (positive? c)))

(define (vanimal? v)
  (or (vcat? v) (vcham? v)))

