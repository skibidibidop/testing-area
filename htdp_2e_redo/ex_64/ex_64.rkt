;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_64) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 64. The Manhattan distance of a point to the origin considers a
path that follows the rectangular grid of streets found in Manhattan. Here
are two examples:

The left one shows a “direct” strategy, going as far left as needed, followed
by as many upward steps as needed. In comparison, the right one shows
a “random walk” strategy, going some blocks leftward, some upward, and
so on until the destination—here, the origin—is reached.

Stop! Does it matter which strategy you follow?

Design the function manhattan-distance, which measures the
Manhattan distance of the given posn to the origin.
|#

; It seems to me that both strategies end with the same distance traversed,
; so I don't think it matters which one we follow.

; I'm not sure, but I think I just need to add posn-x and posn-y here since
; we're just calculating the total distance traversed.

; Posn -> Number
; Gets the Manhattan distance based on coord
(check-expect (manhattan_distance (make-posn 3 5)) 8)

(define (manhattan_distance coord)
  (+ (posn-x coord) (posn-y coord)))