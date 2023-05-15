#|
Author: Mark Beltran
Date: May 16, 2023

Classify if image is
tall, wide, or square.
|#

(require 2htdp/image)

; Images
(define image_t
  (rectangle 30 50 "solid" "red"))
(define image_w
  (rectangle 50 30 "solid" "blue"))
(define image_s
  (square 30 "solid" "violet"))
(define image_s2
  (rectangle 20 20 "solid" "yellow"))

; Function
(define (proportion image)
  (cond[(> (image-height image)
           (image-width image))
        "Tall"]
       [(< (image-height image)
           (image-width image))
        "Wide"]
       [else "Square"]))
