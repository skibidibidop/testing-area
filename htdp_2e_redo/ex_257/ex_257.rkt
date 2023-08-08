;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_257) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 8, 2023

Exercise 257. You can design build-list and foldl with the design
recipes that you know, but they are not going to be like the ones that ISL
provides. For example, the design of your own foldl function requires a
use of the list reverse function:

; [X Y] [X Y -> Y] Y [List-of X] -> Y
; f*oldl works just like foldl
(check-expect (f*oldl cons '() '(a b c))
              (foldl cons '() '(a b c)))
(check-expect (f*oldl / 1 '(6 3 2))
              (foldl / 1 '(6 3 2)))

(define (f*oldl f e l)
  (foldr f e (reverse l)))

Design build-l*st, which works just like build-list. Hint Recall
the add-at-end function from exercise 193. Note on Design Part VI cov-
ers the concepts needed to design these functions from scratch.
|#

