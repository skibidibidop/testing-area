;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_139) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 139. Now take a look at this data definition:

; A List-of-numbers is one of:
; -- '()
; -- (cons Number List-of-numbers)

Some elements of this class of data are appropriate inputs for sum from
exercise 138 and some aren’t.

Design the function pos?, which consumes a List-of-numbers and determines
whether all numbers are positive numbers. In other words, if (pos? l) yields
#true, then l is an element of List-of-amounts. Use DrRacket’s stepper to
understand how pos? works for (cons 5 '()) and (cons -1 '()).

Also design checked-sum. The function consumes a List-of-numbers.
It produces their sum if the input also belongs to List-of-amounts;
otherwise it signals an error. Hint Recall to use check-error.

What does sum compute for an element of List-of-numbers?
|#

; List-of-numbers -> Boolean
; Checks if all list members are positive numbers
(check-expect (pos? '()) #true)
(check-expect (pos? (cons 2 '())) #true)
(check-expect (pos? (cons 0 (cons 3 '()))) #false)
(check-expect (pos? (cons 1 (cons 2 (cons 3 '())))) #true)
(check-expect (pos? (cons 0 (cons -44 '()))) #false)

(define (pos? ln)
  (cond
    [(empty? ln) #true]
    [else
     (and (> (first ln) 0)
          (pos? (rest ln)))]))

