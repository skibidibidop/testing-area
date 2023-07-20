;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_67) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 20, 2023

Sample Problem
Develop a structure type definition for a pro-
gram that deals with “bouncing balls,” briefly mentioned at the
very beginning of this chapter. The ball’s location is a single
number, namely the distance of pixels from the top. Its constant
speed is the number of pixels it moves per clock tick. Its velocity
is the speed plus the direction in which it moves.
|#

(define-struct ball [loc vel])
; (make-ball Number Number)
; Interp.: (make-ball 10 -3), represents:
; the ball's location, 10 pixels from the top
; the ball's velocity, moving upward 3 pixels per tick