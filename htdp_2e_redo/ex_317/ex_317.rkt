;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex_317) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 16, 2023

Exercise 317. A program that consists of three connected functions
ought to express this relationship with a local expression.

Copy and reorganize the program from figure 117 into a single function
using local. Validate the revised code with the test suite for count.

The second argument to the local functions, sy, never changes. It is
always the same as the original symbol. Hence you can eliminate it from
the local function definitions to tell the reader that sy is a constant across
the traversal process.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An S-expr is one of:
; -- Atom
; -- SL

; An Atom is one of:
; -- Number
; -- String
; -- Symbol

; An SL is one of:
; -- '()
; -- (cons S-expr SL)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Any -> Boolean
; Is a an Atom
(check-expect (atom? "hi!") #true)
(check-expect (atom? 1000) #true)
(check-expect (atom? 'z) #true)
(check-expect (atom? (make-posn 1 2)) #false)

(define (atom? a)
  (or (string? a)
      (number? a)
      (symbol? a)))

