;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname convert_to_nonnegative) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 15, 2023

Convert <in> to non-negative number.
String: determines length
Image: area of the image
Number: absolute value
#true: 10
#false: 20
|#

(require 2htdp/image)

(define (get_image_area image)
  (* (image-height image)
     (image-width image)))

(define (convert in)
  (cond [(string? in)
         (string-append "String length: "
                        (number->string
                         (string-length in)))]
        [(image? in)
         (string-append "Image area: "
                        (number->string
                         (get_image_area in)))]
        [(number? in)
         (string-append "Absolute value: "
                        (number->string
                         (abs in)))]
        [(false? in) 20]
        [#true 10]
        [else "Invalid usage."]))
