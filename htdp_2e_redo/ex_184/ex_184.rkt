;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_184) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 184. Determine the values of the following expressions:

1. (list (string=? "a" "b") #false)
2. (list (+ 10 20) (* 10 20) (/ 10 20))
3. (list "dana" "jane" "mary" "laura")

Use check-expect to express your answers.
|#

(check-expect (list (string=? "a" "b") #false)
              (list #false #false))

(check-expect (list (+ 10 20) (* 10 20) (/ 10 20))
              (list 30 200 0.5))

(check-expect (list "dana" "jane" "mary" "laura")
              (list "dana" "jane" "mary" "laura"))