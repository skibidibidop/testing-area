;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_65) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 65. Take a look at the following structure type definitions:

• (define-struct movie [title producer year])
• (define-struct person [name hair eyes phone])
• (define-struct pet [name number])
• (define-struct CD [artist title price])
• (define-struct sweater [material size producer])

Write down the names of the functions (constructors, selectors, and
predicates) that each introduces.

Answers:

(define-struct movie [title producer year])
(make-movie)
(movie-title)
(movie-producer)
(movie-year)
(movie?)

(define-struct person [name hair eyes phone])
(make-person)
(person-name)
(person-hair)
(person-eyes)
(person-phone)
(person?)

(define-struct pet [name number])
(make-pet)
(pet-name)
(pet-number)
(pet?)

(define-struct CD [artist title price])
(make-CD)
(CD-artist)
(CD-title)
(CD-price)
(CD?)

(define-struct sweater [material size producer])
(make-sweater)
(sweater-material)
(sweater-size)
(sweater-producer)
(sweater?)
|#
