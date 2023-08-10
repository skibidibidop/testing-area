;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_272) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 272. Recall that the append function in ISL concatenates the
items of two lists or, equivalently, replaces '() at the end of the first list
with the second list:

(equal? (append (list 1 2 3) (list 4 5 6 7 8))
        (list 1 2 3 4 5 6 7 8))

Use foldr to define append-from-fold. What happens if you replace
foldr with foldl?

Now use one of the fold functions to define functions that compute the
sum and the product, respectively, of a list of numbers.

With one of the fold functions, you can define a function that horizon-
tally composes a list of Images.

Hints
(1) Look up beside and empty-image. Can you use the other fold function?
Also define a function that stacks a list of images vertically.
(2) Check for above in the libraries.
|#