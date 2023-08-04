#|
Author: Mark Beltran
Date: August 4, 2023

Sample Problem: Design a function that draws connections between
a given bunch of dots and into a given scene.

Exercise 192. Argue why it is acceptable to use last on Polygons.

; Because the first point will also serve as the last point to connect to.

Also argue why you may adapt the template for connect-dots to last:

(define (last p)
  (cond
    [(empty? (rest p)) (... (first p) ...)]
    [else (... (first p) ... (last (rest p)) ...)]))

; This can be used for non-empty lists. The last member will always be
; the first of the final list.

Finally, develop examples for last, turn them into tests, and ensure that
the definition of last in figure 73 works on your examples.
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
; Renders the given polygon p into img
(check-expect (render-polygon MT triangle-p)
              (scene+line
               (scene+line
                (scene+line MT 20 10 20 20 "red")
                20 20 30 20 "red")
               30 20 20 10 "red"))
(check-expect (render-polygon MT square-p)
              (scene+line
               (scene+line
                (scene+line
                 (scene+line MT 10 10 20 10 "red")
                 20 10 20 20 "red")
                20 20 10 20 "red")
               10 20 10 10 "red"))

; Image Polygon -> Image
; adds an image of p to img
(define (render-polygon img p)
  (render-line (connect-dots img p)
               (first p)
               (last p)))

; Image NELoP -> Image
; connects the dots in p by rendering lines in img
(check-expect (connect-dots MT triangle-p)
              (scene+line
               (scene+line MT 20 20 30 20 "red")
               20 10 20 20 "red"))
(check-expect (connect-dots MT square-p)
              (scene+line
               (scene+line
                (scene+line MT 10 10 20 10 "red")
                20 10 20 20 "red")
               20 20 10 20 "red"))

(define (connect-dots img p)
  (cond
    [(empty? (rest p)) img]
    [else
     (render-line
      (connect-dots img (rest p))
      (first p)
      (second p))]))

; Image Posn Posn -> Image
; renders a line from p to q into img
(define (render-line img p q)
  (scene+line
   img
   (posn-x p) (posn-y p) (posn-x q) (posn-y q)
   "red"))

; NELoP -> Posn
; extracts the last item from p
(define (last p)
  (first p))

