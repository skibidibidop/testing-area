;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex_290) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 12, 2023

Exercise 290. Recall that the append function in ISL concatenates the
items of two lists or, equivalently, replaces '() at the end of the first list
with the second list:

(equal? (append (list 1 2 3) (list 4 5 6 7 8))
        (list 1 2 3 4 5 6 7 8))

Use foldr to define append-from-fold. What happens if you replace
foldr with foldl?

Now use one of the fold functions to define functions that compute the
sum and the product, respectively, of a list of numbers.

With one of the fold functions, you can define a function that horizontally
composes a list of Images. Hints (1) Look up beside and empty-image. Can you
use the other fold function? Also define a function that stacks a list of
images vertically. (2) Check for above in the libraries.
|#

(require 2htdp/image)

(define SQ_SOLID (square 10 "solid" "red"))
(define SQ_OUT (square 10 "outline" "red"))

; [List-of X] [List-of X] -> [List-of X]
; Combines l1 and l2 into a single list
(check-expect (append-from-fold '() '()) '())
(check-expect (append-from-fold '() (list 3 4)) (list 3 4))
(check-expect (append-from-fold (list 1 2) '()) (list 1 2))
(check-expect (append-from-fold (list 1 2) (list 3 4)) (list 1 2 3 4))

(define (append-from-fold l1 l2)
  (foldr
   (lambda (a_member a_list)
     (cons a_member a_list))
   l2
   l1))

; [List-of Number] -> Number
; Computes the sum of all members of l1
(check-expect (sum_members '()) 0)
(check-expect (sum_members (list 1)) 1)
(check-expect (sum_members (list 1 2)) 3)

(define (sum_members ln)
  (foldl + 0 ln))

; [List-of Number] -> Number
; Computes the product of all members of l
(check-expect (mult_members '()) 1)
(check-expect (mult_members (list 1)) 1)
(check-expect (mult_members (list 1 2)) 2)

(define (mult_members ln)
  (foldl * 1 ln))

; [List-of Image] -> Image
; Horizontally composes a list of Images
(check-expect (hor_img '()) empty-image)
(check-expect (hor_img (list SQ_OUT SQ_SOLID SQ_OUT SQ_SOLID))
              (beside SQ_OUT SQ_SOLID SQ_OUT SQ_SOLID empty-image))

(define (hor_img limg)
  (foldr
   (lambda (an_img bg)
     (beside an_img bg))
   empty-image
   limg))