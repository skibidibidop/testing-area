#|
Author: Mark Beltran
Date: August 5, 2023

Exercise 194. Modify connect-dots so that it consumes an additional
Posn to which the last Posn is connected. Then modify render-poly to
use this new version of connect-dots.
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

; Image Polygon Posn -> Image
; adds an image of p to MT
(define (render-polygon img lp pos)
  (connect-dots img lp pos))

; Image NELoP Posn -> Image
; connects the Posns in an image
(define (connect-dots img lp pos)
  (cond
    [(empty? (rest lp))
     (render-line MT (first lp) pos)]
    [else (render-line (connect-dots img (rest lp) pos)
                       (first lp)
                       (second lp))]))

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
