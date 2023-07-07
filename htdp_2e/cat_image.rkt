; Author: Mark Beltran
; Date: May 15, 2023

; Count the pixels of the inserted image

(require 2htdp/image)

; Can't paste image of cat using text editor
(define cat <image here>)

(define (pixel_count image)
  (* (image-width image)
     (image-height image)))

(define pixels
  (number->string
   (pixel_count cat)))

(string-append "Pixels: " pixels)
