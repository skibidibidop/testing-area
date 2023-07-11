;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_236) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 11, 2023

Exercise 236
Create test suites for the given functions, then abstract over them. Define
the functions in terms of the abstraction as one-liners and use the existing
test suites to confirm that the revised definitions work properly. Finally,
design a function that subtracts 2 from each number on a given list.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; A Num_list is one of:
; '()
; (cons Number Num_list)
; Interp.: a list of Numbers

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Num_list -> Num_list
; Adds 1 to each item on l
(define (add1* l)
  (cond
    [(empty? l) '()]
    [else
     (cons
      (add1 (first l))
      (add1* (rest l)))]))

; Num_list -> Num_list
; Adds 5 to each item on l
(define (plus5 l)
  (cond
    [(empty?) '()]
    [else
     (cons
      (+ (first l) 5)
      (plus5 (rest l)))]))