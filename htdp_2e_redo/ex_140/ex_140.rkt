;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_140) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 140. Design the function all-true, which consumes a list of
Boolean values and determines whether all of them are #true. In other
words, if there is any #false on the list, the function produces #false.

Now design one-true, a function that consumes a list of Boolean val-
ues and determines whether at least one item on the list is #true.
|#

; List-of-booleans -> Boolean
; Checks if all list members are #true
(check-expect (all-true '()) #true)
(check-expect (all-true (list #true)) #true)
(check-expect (all-true (list #true #false #true)) #false)
(check-expect (all-true (list #false #false)) #false)

(define (all-true lob)
  (cond
    [(empty? lob) #true]
    [else
     (and (first lob)
          (all-true (rest lob)))]))

; List-of-booleans -> Boolean
; Checks if there is at least one #true value in the list
(check-expect (one-true '()) #false)
(check-expect (one-true (list #true)) #true)
(check-expect (one-true (list #true #false #true)) #true)
(check-expect (one-true (list #false #false)) #false)

(define (one-true lob)
  (cond
    [(empty? lob) #false]
    [else
     (or (first lob)
         (one-true (rest lob)))]))