;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_89) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 23, 2023

Exercise 89. Design the happy-cat world program, which manages
a walking cat and its happiness level. Let’s assume that the cat starts out
with perfect happiness.

Hints (1) Reuse the functions from the world programs in chapter 3.7.
(2) Use structure type from the preceding exercise to represent the state of
the world.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 1)
(define SCN_WIDTH (* SCALER 250))
(define SCN_HEIGHT (* SCALER 100))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define GAUGE_HEIGHT (* SCALER 10))
(define HGAUGE_YCENTER (/ GAUGE_HEIGHT 2))
(define HGAUGE (rectangle SCN_WIDTH GAUGE_HEIGHT "solid" "red"))
(define HGAUGE_BG (empty-scene SCN_WIDTH GAUGE_HEIGHT))
(define HGAUGE_START SCN_XCENTER)

(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct cat [x h])
; (make-cat Number Happiness)
; Interp.: (make-cat 30 50) represents the cat's x-coordinate and happiness

; A Happiness is a Number
; Interp.: represents the distance in pixels between the left border and the
; center of the HGAUGE

; A VCat is a Cat

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; VCat -> Image
; Renders an Image based on data from VCat vc
(define (render vc) BG)



; MAIN /////////////////////////////////////////////////////////////////////////

(define (happy_cat state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]
    [on-key change_mood]))