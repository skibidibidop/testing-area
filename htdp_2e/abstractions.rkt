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

; String_list -> Boolean
; Does String_list l contain "atom"
(check-expect (contains_atom? "atom" list_235) #false)

(define (contains_atom? s l)
  (contains? "atom" l))

; String_list -> Boolean
; Does String_list l contain "basic"
(check-expect (contains_basic? "basic" list_235) #true)

(define (contains_basic? s l)
  (contains? "basic" l))

; String_list -> Boolean
; Does String_list l contain "zoo"
(check-expect (contains_zoo? "zoo" list_235) #false)

(define (contains_zoo? s l)
  (contains? "zoo" l))
