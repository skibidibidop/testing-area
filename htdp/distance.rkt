;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname distance) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 15, 2023

Compute the distance from the origin (0, 0)
to the provided point (x, y).
|#

(define (get_distance x y)
  (sqrt
   (+ (sqr x)
      (sqr y))))