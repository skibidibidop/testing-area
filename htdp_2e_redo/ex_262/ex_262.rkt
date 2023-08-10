;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_262) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 9, 2023

Exercise 262. Design the function identityM, which creates diagonal
squares of 0s and 1s:

> (identityM 1)
(list (list 1))
> (identityM 3)
(list (list 1 0 0) (list 0 1 0) (list 0 0 1))

Use the structural design recipe and exploit the power of local.
|#

; Number -> [List-of [List-of Number]]
; Creates diagonal squares of 0s and 1s
(check-expect (identityM 0) '())
(check-expect (identityM 1) (list (list 1)))
(check-expect (identityM 2) (list (list 1 0)
                                  (list 0 1)))
(check-expect (identityM 3) (list (list 1 0 0)
                                  (list 0 1 0)
                                  (list 0 0 1)))

(define (identityM n)
 (local
   [(define (gen_row i)
      (local
        [(define (one_or_zero j)
           (if (= i j) 1 0))]
      (build-list n one_or_zero)))]
   (build-list n gen_row)))