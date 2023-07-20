;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_63) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 20, 2023

(define (distance-to-0 ap)
  (sqrt
   (+ (sqr (posn-x ap))
      (sqr (posn-y ap)))))

Exercise 63. Evaluate the following expressions:

• (distance-to-0 (make-posn 3 4))
• (distance-to-0 (make-posn 6 (* 2 4)))
• (+ (distance-to-0 (make-posn 12 5)) 10)

by hand. Show all steps. Assume that sqr performs its computation in a
single step. Check the results with DrRacket’s stepper.
|#

; (distance-to-0 (make-posn 3 4))
; Get the square of 3. 9
; Get the square of 4. 16
; Add these two. 25
; Get the square root. 5

; (distance-to-0 (make-posn 6 (* 2 4)))
; Get the square of 6. 36
; Get the square of 8. 64
; Add these two. 100
; Get the square root. 10

; (+ (distance-to-0 (make-posn 12 5)) 10)
; Get the square of 12. 144
; Get the square of 5. 25
; Add these two. 169
; Get the square root. 13
; Add 10. 23