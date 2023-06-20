;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname polygon) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 19, 2023

Code-along: 11.4 Polygon sample problem
|#

(require 2htdp/image)

(define SCALER 10)
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
(define triangle_p
  (list
   (make-posn 20 10)
   (make-posn 20 20)
   (make-posn 30 20)))
(define square_p
  (list
   (make-posn 10 10)
   (make-posn 20 10)
   (make-posn 20 20)
   (make-posn 10 20)))

(check-expect (render_poly BG triangle_p)
              (scene+line
               (scene+line
                (scene+line BG 20 10 20 20 "red")
                20 20 30 20 "red")
               30 20 20 10 "red"))
(check-expect (render_poly BG square_p)
              (scene+line
               (scene+line
                (scene+line
                 (scene+line BG 10 10 20 10 "red")
                 20 10 20 20 "red")
                20 20 10 20 "red")
               10 20 10 10 "red"))

(define (render_poly img p)
  (cond
    [(empty? (rest (rest (rest p))))
     (render_line
      (render_line
       (render_line BG (first p) (second p))
       (second p) (third p))
      (third p) (first p))]
    [else
     (render_line (render_poly BG (rest p))
                  (first p)
                  (second p))]))

; Image Posn Posn -> Image
; Draws a red line from Posn p to Posn q into img
(check-expect (render_line BG (make-posn 10 20) (make-posn 50 80))
              (scene+line BG 10 20 50 80 "red"))

(define (render_line img p q)
  (scene+line
   img
   (posn-x p) (posn-y p) (posn-x q) (posn-y q)
  "red"))