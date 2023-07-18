;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 5.
|#

(require 2htdp/image)

(define SCALER 100)

(define SWIDTH (* SCALER 4))
(define SHEIGHT (* SCALER 2))
(define XCENTER (/ SWIDTH 2))
(define YCENTER (/ SHEIGHT 2))

(define BG (empty-scene SWIDTH SHEIGHT))

(define LEFT_SIDE
  (triangle/sas SCALER
                90
                SCALER
                "solid" "brown"))
(define RIGHT_SIDE
  (triangle/ass 90
                SCALER
                SCALER
                "solid" "brown"))
(define BASE
  (rectangle (* SCALER 2) SCALER  "solid" "brown"))

(define SIDE_SIZE (/ (image-width LEFT_SIDE) 2))
(define BOAT_HEIGHT (- SHEIGHT SIDE_SIZE))

(place-images
 (list LEFT_SIDE
       BASE
       RIGHT_SIDE)
 (list (make-posn SIDE_SIZE BOAT_HEIGHT)
       (make-posn XCENTER BOAT_HEIGHT)
       (make-posn (- SWIDTH SIDE_SIZE) BOAT_HEIGHT))
 BG)