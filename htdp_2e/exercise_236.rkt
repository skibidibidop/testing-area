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

(define nlist (list 0 5 3 7))

; Num_list -> Num_list
; Adds 1 to each item on l
(check-expect (add1* nlist) (list 1 6 4 8))

(define (add1* l)
  (cond
    [(empty? l) '()]
    [else
     (cons
      (add1 (first l))
      (add1* (rest l)))]))

; Num_list -> Num_list
; Adds 5 to each item on l
(check-expect (plus5 nlist) (list 5 10 8 12))

(define (plus5 l)
  (cond
    [(empty? l) '()]
    [else
     (cons
      (+ (first l) 5)
      (plus5 (rest l)))]))

; Number Num_list -> Num_list
; Add Number n to all members of Num_list nl
(check-expect (add_to_all 3 nlist) (list 3 8 6 10))

(define (add_to_all n nl)
  (cond
    [(empty? nl) '()]
    [else
     (cons
      (+ n (first nl))
      (add_to_all n (rest nl)))]))

; Number Num_list -> Num_list
(check-expect (add_1 1 nlist) (list 1 6 4 8))

(define (add_1 n nl)
  (add_to_all 1 nl))

; Number Num_list -> Num_list
(check-expect (add_5 5 nlist) (list 5 10 8 12))

(define (add_5 n nl)
  (add_to_all 5 nl))

; Num_list -> Num_list
; Subtracts 2 from all members of Num_list nl
(check-expect (sub_2 nlist) (list -2 3 1 5))

(define (sub_2 nl)
  (cond
    [(empty? nl) '()]
    [else
     (cons (- (first nl) 2)
           (sub_2 (rest nl)))]))