;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cat_cham) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 2, 2023

Simulates a cat or chameleon pet based on initial input.
Pets change their movement direction upon reaching
the border.
Certain key strokes can change the chosen pet's mood.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)

; IMAGES ///////////////////////////////////////////////////

(define SWIDTH (* SCALER 20))
(define SHEIGHT (* SCALER 10))

(define CAT (circle (* SCALER 5) "solid" "brown"))

(define CHAMELEON
  (rectangle (* SCALER 6) (* SCALER 3) "solid" "red"))

(define HGAUGE (rectangle SWIDTH SHEIGHT "solid" "red"))
(define HGAUGE_YPOS (/ (image-height HGAUGE) 2))
(define HGAUGE_FULL (/ SWIDTH 2))
(define HGUAGE_EMPTY (- 0 (/ SWIDTH 2)))

(define RIGHT_SPD 3)
(define LEFT_SPD -3)

(define BG (empty-scene SWIDTH SHEIGHT))

; DATA DEFINITIONS /////////////////////////////////////////

(define-struct vcat [hpos xpos vel])
; vcat: (make-vcat Number Number Number)
; Interp.:
; (make-vcat hpos xpos vel), a cat with the following:
; hpos: center (x-coordinate) of the cat's happiness gauge.
;     : Gauge is full if this is at HGAUGE_FULL.
;     : Gauge is empty if this is at HGAUGE_EMPTY.
; xpos: x-coordinate of CAT
; vel: velocity (RIGHT_SPD or LEFT_SPD) of CAT
; (define vcat1 (make-vcat 30 40 RIGHT_SPD))
#;
(define (fn_for_vcat c)
  (...(vcat-hpos c) (vcat-xpos c) (vcat-vel c)))

(define-struct vcham [hpos xpos vel])
; vcham: (make-vcham Number Number Number)
; Interp.:
; (make-vcham hpos xpos vel), a chameleon w/ the following:
; hpos: center (x-coordinate) of the chameleon's happiness
;     : gauge. Gauge is full if it is at HGAUGE_FULL, and
;     : it is empty if at HGAUGE_EMPTY.
; xpos: x-coordinate of CHAMELEON.
; vel: velocity (RIGHT_SPD or LEFT_SPD) of CHAMELEON
; (define vcham1 (make-vcham 40 50 LEFT_SPD))
#;
(define (fn_for_vcham ch)
  (...(vcham-hpos ch) (vcham-xpos ch) (vcham-vel ch)))

; A vanimal is either:
; -- a vcat
; -- a vcham
; Interp.:
;   vcat  - happiness gauge, x-coord, velocity of CAT
;   vcham - happiness gauge, x-coord, velocity of CHAMELEON
; (define VA1 (make-vcat 20 50 RIGHT_SPD))
; (define VA2 (make-vcham 30 40 LEFT_SPD))
#;
(define (fn_for_vanimal va)
  (cond[(vcat? va) (...)]
       [(vcham? va) (...)]
       [else (...)]))