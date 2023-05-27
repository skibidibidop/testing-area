;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname simple_space_invaders) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 27, 2023

Simple space invaders game
|#

(require 2htdp/universe)
(require 2htdp/image)

(define SCALER 10)

; Scene dimensions
(define SCN_WIDTH (* SCALER 50))
(define SCN_HEIGHT (* SCALER 100))

; 