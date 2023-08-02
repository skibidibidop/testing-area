;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_153) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: Aug 2, 2023

Exercise 153. The goal of this exercise is to visualize the result of a
1968-style European student riot. Here is the rough idea. A small group
of students meets to make paint-filled balloons, enters some lecture hall,
and randomly throws the balloons at the attendees. Your program displays
how the balloons color the seats in the lecture hall.

Use the two functions from exercise 152 to create a rectangle of 8 by 18
squares, each of which has size 10 by 10. Place it in an empty-scene of
the same size. This image is your lecture hall.

Design add-balloons. The function consumes a list of Posn whose
coordinates fit into the dimensions of the lecture hall. It produces an image
of the lecture hall with red dots added as specified by the Posns.

Figure 60 shows the output of our solution when given some list of
Posns. The left-most is the clean lecture hall, the second one is after two
balloons have hit, and the last one is a highly unlikely distribution of 10
hits. Where is the 10th?
|#

(require 2htdp/image)

(define SCALER 1)
(define SCN_WIDTH (* SCALER 80))
(define SCN_HEIGHT (* SCALER 180))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define BG (empty-scene (* SCALER 80) (* SCALER 180)))

(define CIRCLE_IMG (circle (* SCALER 10) "outline" "red"))
(define SQUARE_IMG (square (* SCALER 10) "outline" "black"))

(define RED_DOT (circle (* SCALER 2) "solid" "red"))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; N Image -> Image
; Produces a column of n copies of img
(check-expect (col 0 CIRCLE_IMG) empty-image)
(check-expect (col 1 SQUARE_IMG)
              (above SQUARE_IMG empty-image))
(check-expect (col 3 CIRCLE_IMG)
              (above CIRCLE_IMG CIRCLE_IMG CIRCLE_IMG empty-image))

(define (col n img)
  (cond
    [(= n 0) empty-image]
    [else
     (above img (col (- n 1) img))]))

; N Image -> Image
; Produces a row of n copies of img
(check-expect (row 0 CIRCLE_IMG) empty-image)
(check-expect (row 1 SQUARE_IMG)
              (beside SQUARE_IMG empty-image))
(check-expect (row 2 CIRCLE_IMG)
              (beside CIRCLE_IMG CIRCLE_IMG empty-image))

(define (row n img)
  (cond
    [(= n 0) empty-image]
    [else
     (beside img (row (- n 1) img))]))

(define GRID_COLUMN (col 18 SQUARE_IMG))
(define GRID
  (place-image (row 8 GRID_COLUMN) SCN_XCENTER SCN_YCENTER BG))

; Posn_list -> Image
; Places red dots on GRID based on coordinates in Posn_list pl
(check-expect (add-balloons '()) GRID)
(check-expect (add-balloons (list (make-posn 5 10)))
              (place-images
               (list RED_DOT)
               (list (make-posn 5 10))
               GRID))

(define (add-balloons pl)
  (cond
    [(empty? pl) GRID]
    [else
     (place-image
      RED_DOT (posn-x (first pl)) (posn-y (first pl))
      (add-balloons (rest pl)))]))

; MAIN /////////////////////////////////////////////////////////////////////////

