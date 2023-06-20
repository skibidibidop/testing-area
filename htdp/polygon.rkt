;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname polygon) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 19, 2023

Code-along: 11.4 Polygon sample problem
|#

(define (SCALER 10))
(define SWIDTH (* SCALER 5))
(define SHEIGHT (* SCALER 5))

(define BG (empty-scene SWIDTH SHEIGHT))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Polygon is one of:
; - (cons list Posn Posn Posn)
; - (cons Posn Polygon)
; Interp.: a non-empty list of at least 3 Posns representing points of a polygon

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Image Polygon -> Image
; Renders polygon p into image img
(define (render_poly img p)
  (cond
    [(empty? (rest (rest (rest p))))
     (...(first p)...img...
         (second p)...
         (third p)...)]
    [else
     (...(first p)...
         (render_poly img (rest p))...)]))

; Image Posn Posn -> Image
; Draws a red line from Posn p to Posn q into im
(define (render_line im p q) im)