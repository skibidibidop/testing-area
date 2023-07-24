;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_88) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 23, 2023

Exercise 88. Define a structure type that keeps track of the cat’s x-coordinate
and its happiness. Then formulate a data definition for cats, dubbed VCat,
including an interpretation.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 1)
(define SCN_WIDTH (* SCALER 250))
(define SCN_HEIGHT (* SCALER 100))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct cat [x h])
; (make-cat Number Happiness)
; Interp.: (make-cat 30 50) represents the cat's x-coordinate and happiness

; A Happiness is a Number
; Interp.: represents the distance in pixels between the left border and the
; center of the HGAUGE

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; MAIN /////////////////////////////////////////////////////////////////////////
