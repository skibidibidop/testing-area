;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname chameleon_pet) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 26, 2023

- Chameleon walks from left to right.
- If right border is reached, teleport to left border.
- Happiness gauge decreases over time.
- Happiness can be increased by 2 with keystroke "down".
- Keystroke "r" turns the chameleon red.
- Keystroke "b" turns the chameleon blue.
- Keystroke "g" turns the chameleon green.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)
(define MOVSPD 3)
(define HUNGER 0.1)
(define SCN_X (* SCALER 30))
(define SCN_Y (* SCALER 10))

(define hgauge
  (rectangle SCN_X SCALER "solid" "red"))
(define hg_xpos (/ (image-width hgauge) 2))

(define-struct vcham [hg x color])
; vcham: a structure
; (make-vcham Number Number String)
; Interpretation: (make-vcham happiness cham_x cham_color)
; - vcham-hg is the happiness gauge's center point.
; The happiness gauge being completely out of the scene
; represents depleted happiness.
; - vcham-x the chameleon's x-coordinate.
; - vcham-color is the chameleon's color.

; wstate -> wstate
; Increases vcham-x by MOVSPD per tick 
; Decreases vcham-hg by HUNGER per tick
(check-expect (time_step (make-vcham ...) ...))