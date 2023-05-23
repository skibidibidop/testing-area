;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname get_3d_distance) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 23, 2023

Computes the distance of objects in
a 3D space to the origin.
|#

(define-struct r3 [x y z])
; An R3 is a structure:
; (make-r3 [Number Number Number])
; Interpretation: has values for the
; three directions

(define ex1 (make-r3 1 2 13))
(define ex2 (make-r3 0 0 2))

; R3 -> Number
; Calculate distance from point (3D) to
; origin (0, 0)
(check-expect (get_dist ex2) 2)
(define (get_dist coord_3d)
  (sqrt (+ (sqr (r3-x coord_3d))
           (sqr (r3-y coord_3d))
           (sqr (r3-z coord_3d)))))

(get_dist ex1)
