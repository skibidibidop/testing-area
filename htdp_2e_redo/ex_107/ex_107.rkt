;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_107) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 26, 2023

Exercise 107. Design the cham-and-cat program, which deals with
both a virtual cat and a virtual chameleon. You need a data definition for a
“zoo” containing both animals and functions for dealing with it.
The problem statement leaves open how keys manipulate the two ani-
mals. Here are two possible interpretations:

1. Each key event goes to both animals.
2. Each key event applies to only one of the two animals.

For this alternative, you need a data representation that specifies a
focus animal, that is, the animal that can currently be manipulated. To
switch focus, have the key-handling function interpret "k" for “kitty”
and "l" for lizard. Once a player hits "k", the following keystrokes
apply to the cat only—until the player hits "l".

Choose one of the alternatives and design the appropriate program.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 1)

(define SCN_WIDTH (* SCALER 400))
(define SCN_HEIGHT (* SCALER 200))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

(define CAT_RAD (* SCALER 25))
(define CAT (circle CAT_RAD "solid" "brown"))

(define CHAM_WIDTH (* SCALER 40))
(define CHAM_HEIGHT (* SCALER 15))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct zoo [cat cham])
; (make-zoo VCat VCham)
; Interp.: represents the current state, has data for both the cat
; and the chameleon

(define-struct vcat [loc hap])
; (make-vcat Number Number)
; Interp.: (make-vcat l h), represents the cat's x-coordinate (l)
; and happiness level (h)

(define-struct vcham [loc hap col])
; (make-vcham Number Number Color)
; Interp.: (make-vcham l h c), represents the chameleon's
; x-coordinate (l), happiness (h), and color (c)

; A Color is one of:
; "red"
; "green"
; "blue"
; Interp.: a chameleon's color

; FUNCTIONS ////////////////////////////////////////////////////////////////////

