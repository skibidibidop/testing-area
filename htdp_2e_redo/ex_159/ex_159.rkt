#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 159. Turn the solution of exercise 153 into a world program. Its
main function, dubbed riot, consumes how many balloons the students
want to throw; its visualization shows one balloon dropping after another
at a rate of one per second. The function produces the list of Posns where
the balloons hit.

Hints
(1) Here is one possible data representation:

(define-struct pair [balloon# lob])
; A Pair is a structure (make-pair N List-of-posns)
; A List-of-posns is one of:
; -- '()
; -- (cons Posn List-of-posns)
; interpretation (make-pair n lob) means n balloons
; must yet be thrown and added to lob

(2) A big-bang expression is really just an expression. It is legitimate
to nest it within another expression.

(3) Recall that random creates random numbers.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 1)
(define SCN_WIDTH   (* SCALER 80))
(define SCN_HEIGHT  (* SCALER 180))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define BG (empty-scene (* SCALER 80) (* SCALER 180)))

(define CIRCLE_IMG (circle (* SCALER 10) "outline" "red"))
(define SQUARE_IMG (square (* SCALER 10) "outline" "black"))

(define RED_DOT (circle (* SCALER 2) "solid" "red"))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct pair [balloon# lob])
; A Pair is a structure (make-pair N List-of-posns)
; A List-of-posns is one of:
; -- '()
; -- (cons Posn List-of-posns)
; interpretation (make-pair n lob) means n balloons
; must yet be thrown and added to lob

; An N is a Natural Number

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

; Pair -> Image
; Places red dots on GRID based on coordinates in Pair p
(check-expect (add-balloons (make-pair 0 '())) GRID)
(check-expect (add-balloons (make-pair 1 (list (make-posn 5 10))))
              (place-images
               (list RED_DOT)
               (list (make-posn 5 10))
               GRID))

(define (add-balloons p)
  (cond
    [(empty? (pair-lob p)) GRID]
    [else
     (place-image
      RED_DOT
      (posn-x (first (pair-lob p)))
      (posn-y (first (pair-lob p)))
      (add-balloons (make-pair
                     (pair-balloon# p)
                     (rest (pair-lob p)))))]))

; Pair -> Pair
; Updates Pair p per tick
(check-expect (time_step (make-pair 0 '())) (make-pair 0 '()))
(check-random (time_step (make-pair 3 '()))
              (make-pair 2 (list (make-posn (random SCN_WIDTH)
                                            (random SCN_HEIGHT)))))

(define (time_step p)
  (cond
    [(= (pair-balloon# p) 0) p]
    [else
     (make-pair (- (pair-balloon# p) 1)
                (cons
                 (make-posn (random SCN_WIDTH) (random SCN_HEIGHT))
                 (pair-lob p)))]))

; MAIN /////////////////////////////////////////////////////////////////////////

; Pair -> Pair
(define (riot state)
  (big-bang state
  [to-draw add-balloons]
  [on-tick time_step 1]))

(riot (make-pair 10 '()))
