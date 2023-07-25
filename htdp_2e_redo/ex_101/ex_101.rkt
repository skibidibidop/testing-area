;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_101) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 25, 2023

Exercise 101. Turn the examples in figure 35 into test cases.
|#

(require 2htdp/image)
(require 2htdp/universe)

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct sigs [ufo tank missile])
; A SIGS.v2 (short for SIGS version 2) is a structure:
; (make-sigs UFO Tank MissileOrNot)
; interpretation represents the complete state of a
; space invader game

; A MissileOrNot is one of:
; -- #false
; -- Posn
; interpretation#false means the missile is in the tank;
; Posn says the missile is at that location

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; MissileOrNot Image -> Image
; adds an image of missile m to scene s
(define (missile-render.v2 m s)
  s)

; MAIN /////////////////////////////////////////////////////////////////////////