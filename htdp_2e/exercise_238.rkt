;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_238) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 11, 2023

Exercise 238
Abstract the given functions into a single function. Both consume non-empty
lists of numbers (Nelon) and produce a single number.

Define inf-1 and sup-1 in terms of the abstract function. Test with the given
lists. Why are these functions slow on some of the long lists?

Modify the original functions with the use of (max), which picks the larger
of two numbers, and (min), which picks the smaller one. Then, abstract again,
define inf-2 and sup-2, and test them with the same inputs again. Why are
these versions so much faster?
|#

(define given_list1
  (list 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1))
(define given_list2
  (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Nelon is one of:
; (cons Number '())
; (cons Number Nelon)
; Interp.: a non-empty list of Numbers

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Nelon -> Number
; Determines the smallest Number n on Nelon l
(define (inf l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (if (< (first l)
            (inf (rest l)))
         (first l)
         (inf (rest l)))]))

; Nelon -> Number
; Determines the largest Number n on Nelon l
(define (sup l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (if (> (first l)
            (sup (rest l)))
         (first l)
         (sup (rest l)))]))