#|
Author: Mark Beltran
Date: August 5, 2023

Exercise 193. Here are two more ideas for defining render-poly:

• render-poly could cons the last item of p onto p and then call
connect-dots.
• render-poly could add the first item of p to the end of p via a version of
add-at-end that works on Polygons.

Use both ideas to define render-poly; make sure both definitions
pass the test cases.
|#

(require 2htdp/image)

(define SCALER 1)

(define SCN_WIDTH  (* SCALER 50))
(define SCN_HEIGHT (* SCALER 50))

(define MT (empty-scene SCN_WIDTH SCN_HEIGHT))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Polygon is one of:
; (list Posn Posn Posn)
; (cons Posn Polygon)

; An NELoP is one of:
; -- (cons Posn '())
; -- (cons Posn NELoP)

(define triangle-p (list (make-posn 20 10)
                         (make-posn 20 20)
                         (make-posn 30 20)))
(define square-p (list (make-posn 10 10)
                       (make-posn 20 10)
                       (make-posn 20 20)
                       (make-posn 10 20)))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Image Polygon -> Image
; adds an image of p to MT
(define (render-polygon img p)
  (render-line (connect-dots img p) (first p) (last p)))

; Image NELoP -> Image
; connects the Posns in p in an image
(define (connect-dots img p)
  (cond
    [(empty? (rest p)) MT]
    [else (render-line (connect-dots img (rest p))
                       (first p)
                       (second p))]))

; Image Posn Posn -> Image
; draws a red line from Posn p to Posn q into im
(define (render-line im p q)
  (scene+line
   im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red"))

; Polygon -> Posn
; extracts the last item from p
(define (last p)
  (cond
    [(empty? (rest (rest (rest p)))) (third p)]
    [else (last (rest p))]))
