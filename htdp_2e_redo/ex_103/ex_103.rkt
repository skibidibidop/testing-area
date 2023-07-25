;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_103) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 25, 2023

Exercise 103. Develop a data representation for the following four kinds
of zoo animals:

• spiders, whose relevant attributes are the number of remaining legs
(we assume that spiders can lose legs in accidents) and the space they
need in case of transport;
• elephants, whose only attributes are the space they need in case of
transport;
• boa constrictors, whose attributes include length and girth; and
• armadillos, for which you must determine appropriate attributes, in-
cluding one that determines the space needed for transport.

Develop a template for functions that consume zoo animals.

Design the fits? function, which consumes a zoo animal and a de-
scription of a cage. It determines whether the cage’s volume is large enough
for the animal.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct zoo_animal [leg size len gir cute])
; (make-zoo_animal Entry Entry Entry Entry Cuteness)
; Interp.: (make-zoo_animal leg s len gir c) represents a zoo animal's
; remaining legs (leg), cage size (s), length (l), girth (g), and cuteness
; level (c).

; An Entry is one of:
; #false
; Number
; Interp.: represents any input that requires a size measurement

; A Cuteness is one of:
; #false
; "low"
; "medium"
; "high"

(define SPIDER (make-zoo_animal 8 50 #false #false #false))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Zoo_animal Number -> Boolean
; Returns #true if the Zoo_animal z can fit in its designated cage size c
(check-expect (fits? SPIDER 50) #true)
(check-expect (fits? SPIDER 45) #false)
(check-expect (fits? SPIDER 100) #true)

(define (fits? z c)
  (<= (zoo_animal-size z) c))