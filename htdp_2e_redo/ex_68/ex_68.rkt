;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_68) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

Exercise 68. An alternative to the nested data representation of balls
uses four fields to keep track of the four properties:

(define-struct ballf [x y deltax deltay])

Programmers call this a flat representation. Create an instance of ballf that
has the same interpretation as ball1.
|#

(define-struct vel [deltax deltay])
(define-struct ball [loc vel])
(define-struct ballf [x y deltax deltay])

(define ball1
  (make-ball (make-posn 30 40) (make-vel -10 5)))

(define flat_ball
  (make-ballf 30 40 -10 5))