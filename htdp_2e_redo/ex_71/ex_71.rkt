;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_71) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 71.
|#

; distances in terms of pixels:
(define HEIGHT 200)
(define MIDDLE (quotient HEIGHT 2))
(define WIDTH 400)
(define CENTER (quotient WIDTH 2))
(define-struct game [left-player right-player ball])

(define game0
  (make-game MIDDLE MIDDLE (make-posn CENTER CENTER)))

; Evaluate (game-ball game0)
; Result: (make-posn 200 200)
; Extracted ball (a posn) from game0 (a game struct)

; Evaluate (posn? (game-ball game0))
; Result: #true
; game-ball is a posn

; Evaluate (game-left-player game0)
; Result: 100
; game0 is a game (struct), with 100 in left-player (selector)