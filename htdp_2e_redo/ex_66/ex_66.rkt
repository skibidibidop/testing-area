;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_66) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 66. Revisit the structure type definitions of exercise 65. Make
sensible guesses as to what kind of values go with which fields. Then create
at least one instance per structure type definition.
|#

(define-struct movie [title producer year])
(define-struct person [name hair eyes phone])
(define-struct pet [name number])
(define-struct CD [artist title price])
(define-struct sweater [material size producer])

(make-movie "Movie Title 2: Electric Boogaloo" "Producer Name" "2000")
(make-person "John Doe" "Pink" "Red" "1234567890")
(make-pet "Eater of Worlds" "420")
(make-CD "Tyler the Creator" "Igor" 60)
(make-sweater "Wool" "Large" "Producer's name")