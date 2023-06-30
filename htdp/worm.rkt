;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname worm) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 29, 2023

Snake game, basically.
|#

(require 2htdp/image)
(require 2htdp/universe)



; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct worm_seg [loc vmove hmove])
; (make-worm_seg Posn Number Number)
; Interp.: (make-worm_seg l v h), represents a segment of a worm, with its
; coordinates (l), vertical velocity (v), and horizontal velocity (h)
(make-worm_seg [(make-posn 30 40) 4 0])

; FUNCTIONS ////////////////////////////////////////////////////////////////////