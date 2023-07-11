;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname abstractions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 11, 2023

Finger exercises for III Abstractions
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A string_list is one of:
; '()
; (cons String String_list)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; String String_list -> Boolean
; Is String s in String_list l
(define (contains? s l)
  (cond
    [(empty? l) #false]
    [else
     (or (string=? s (first l))
         (contains? s (rest l)))]))

; Exercise 235 /////////////////////////////////////////////////////////////////
; Use the contains? function to define functions that search for
; "atom" "basic", and "zoo", respectively.

(define list_235 (list "basic"))

(contains? "atom" list_235)
(contains? "basic" list_235)
(contains? "zoo" list_235)