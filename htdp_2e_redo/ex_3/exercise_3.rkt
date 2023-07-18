;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 3.
|#

(define str "helloworld")
(define i 5)

(define START_OF_FIRST_HALF 0)
(define END_OF_FIRST_HALF i)
(define START_OF_LAST_HALF i)

(string-append
 (substring str
            START_OF_FIRST_HALF
            END_OF_FIRST_HALF)
 "_"
 (substring str
            START_OF_LAST_HALF))