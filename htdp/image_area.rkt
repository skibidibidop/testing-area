#|
Author: Mark Beltran
Date: May 16, 2023

Count the number of pixels
in an image.
|#

(require 2htdp/image)

(define image1
  (rectangle 40 30 "solid" "red"))

(define image2
  (rectangle 20 30 "solid" "blue"))

(define (image-area image)
  (* (image-height image)
     (image-width image)))
