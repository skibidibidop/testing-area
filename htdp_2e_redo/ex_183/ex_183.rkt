;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_183) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 183. On some occasions lists are formed with cons and list.

1. (cons "a" (list 0 #false))
2. (list (cons 1 (cons 13 '())))
3. (cons (list 1 (list 13 '())) '())
4. (list '() '() (cons 1 '()))
5. (cons "a" (cons (list 1) (list #false '())))

Reformulate each of the following expressions using only cons or only
list. Use check-expect to check your answers.
|#

(check-expect (cons "a" (list 0 #false))
              (list "a" 0 #false))

(check-expect (list (cons 1 (cons 13 '())))
              (list
               (list 1 13)))

(check-expect (cons (list 1 (list 13 '())) '())
              (list
               (list 1
                     (list 13 '()))))

(check-expect (list '() '() (cons 1 '()))
              (list '()
                    '()
                    (list 1)))

(check-expect (cons "a" (cons (list 1) (list #false '())))
              (list "a"
                    (list 1)
                    #false '()))