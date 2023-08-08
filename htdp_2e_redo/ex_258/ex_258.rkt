#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 258. Use a local expression to organize the functions for
drawing a polygon in figure 73. If a globally defined function is widely
useful, do not make it local.

Functions from figure 73:

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
|#

(require 2htdp/image)

(define MT (empty-scene 100 100))

(define triangle-p (list (make-posn 20 10)
                         (make-posn 20 20)
                         (make-posn 30 20)))
(define square-p (list (make-posn 10 10)
                       (make-posn 20 10)
                       (make-posn 20 20)
                       (make-posn 10 20)))

(define (make-polygon img p)
  (local
    (; Image NELoP -> Image
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

     ; Image Polygon -> Image
     ; adds an image of p to MT
     (define (render-polygon img p)
       (render-line (connect-dots img p) (first p) (last p))))
    (render-polygon img p)))

(make-polygon MT triangle-p)
          
