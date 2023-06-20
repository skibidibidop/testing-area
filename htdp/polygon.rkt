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
     (render_line
      (render_line
       (render_line BG (first p) (second p))
       (second p) (third p))
      (third p) (first p))]
    [else
     (render_line (render_poly (rest p))
                  (first p)
                  (second p))]))

; Image Posn Posn -> Image
; Draws a red line from Posn p to Posn q into img
(define (render_line img p q)
  (scene+line
   img
   (posn-x p) (posn-y p) (posn-x q) (posn-y q))
  "red")