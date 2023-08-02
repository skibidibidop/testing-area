#|
Author: Mark Beltran
Date: July 30, 2023

Exercise 142. Design the ill-sized? function, which consumes a list
of images loi and a positive number n. It produces the first image on loi
that is not an n by n square; if it cannot find such an image, it produces
#false.

Hint
Use

; ImageOrFalse is one of:
; -- Image
; -- #false

for the result part of the signature.
|#

(require 2htdp/image)

; A List-of-images is one of:
; '()
; (cons Image List-of-images)

(define SQUARE_1 (square 1 "outline" "black"))
(define SQUARE_2 (square 2 "outline" "black"))
(define SQUARE_3 (square 3 "outline" "black"))
(define SQUARE_4 (square 4 "outline" "black"))
(define RECT_1 (rectangle 3 5 "outline" "black"))
(define CIRC_1 (circle 4 "outline" "black"))

(define SQUARE_LIST
  (list SQUARE_1 SQUARE_2 SQUARE_3 SQUARE_4))
(define ASSORTED
  (list SQUARE_1 SQUARE_2 RECT_1 CIRC_1))

; List-of-images PositiveNumber -> ImageOrFalse
; Returns the first image in loi that is not n by n square, #false if it
; can't find such an image
(check-expect (ill-sized? '() 1) #false)
(check-expect (ill-sized? SQUARE_LIST 3) SQUARE_1)
(check-expect (ill-sized? ASSORTED 3) SQUARE_1)
(check-expect (ill-sized? ASSORTED 1) SQUARE_2)

(define (ill-sized? loi n)
  (cond
    [(empty? loi) #false]
    [else
     (if (not (=
               (image-width (first loi))
               n))
         (first loi)
         (ill-sized? (rest loi) n))]))
