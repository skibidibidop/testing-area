;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_185) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 185. You know about first and rest from BSL, but BSL+
comes with even more selectors than that. Determine the values of the
following expressions:

1. (first (list 1 2 3))
2. (rest (list 1 2 3))
3. (second (list 1 2 3))

Find out from the documentation whether third and fourth exist.
|#

; third and four exist based on the documentation

(check-expect (first (list 1 2 3)) 1)

(check-expect (rest (list 1 2 3)) (list 2 3))

(check-expect (second (list 1 2 3)) 2)