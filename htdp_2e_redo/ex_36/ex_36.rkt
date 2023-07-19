#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 36. Design the function image-area,
which counts the number of pixels in a given image.
|#

(require 2htdp/image)

(define img (square 50 "solid" "red"))

; Image -> Number
; COunts the number of pixels in a given image.
(check-expect (image_area img) (* 50 50))

(define (image_area i)
  (* (image-width i) (image-height i)))
