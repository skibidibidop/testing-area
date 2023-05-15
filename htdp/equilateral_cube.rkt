;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname equilateral_cube) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 15, 2023

Input: length of a side of an equilateral cube
Output: the equilateral cube's volume and surface
|#

(define SIDES 6)
(define POWER_OF_2 2)
(define POWER_OF_3 3)

(define (cvolume length)
  (string-append "Volume: "
                 (number->string (expt length POWER_OF_3))))

(define (csurface length)
  (string-append "Surface 