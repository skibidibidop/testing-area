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

(define BG (empty-scene SWIDTH SHEIGHT))

; DATA DEFINITIONS /////////////////////////////////////////



; A vanimal is either:
; -- a vcat
; -- a vcham