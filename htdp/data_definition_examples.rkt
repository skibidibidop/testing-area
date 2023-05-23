;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname data_definition_examples) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 23, 2023

Add examples to given data definitions.
|#

; A Color is one of:
; --- "white"
; --- "yellow"
; --- "orange"
; --- "green"
; --- "red"
; --- "blue"
; --- "black"
; Example: (define sample_color "blue")

; H is a Number between 0 and 100
; -- 0 to 49: Depressed
; -- 50 to 60: Meh
; -- 61 to 80: Content
; -- 81 to 95: Happy
; -- 96 to 100: Ecstatic
; Interpretation: represents a happiness value

(define-struct person [fstname lstname male?])
; A Person is a structure:
; (make-person [String String Boolean])
; Interpretation: contains the first and last name,
; and gender of an individual
(make-person "John" "Smith" #true)

(define-struct dog [owner name age happiness])
; A Dog is a structure:
; (make-dog [Person String PositiveInteger H])
; Interpretation: contains details about the dog's
; owner, the dog's name, its age, and happiness level
(make-dog (make-person "John" "Smith" #true)
           "Optimus Prime" 10 81)
