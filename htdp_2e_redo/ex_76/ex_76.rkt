#|
Author: Mark Beltran
Date: July 21, 2023

Exercise 76. Formulate data definitions for the following structure type
definitions:

• (define-struct movie [title producer year])
• (define-struct person [name hair eyes phone])
• (define-struct pet [name number])
• (define-struct CD [artist title price])
• (define-struct sweater [material size producer])

Make sensible assumptions as to what kind of values go into each field.
|#

(define-struct movie [title producer year])
; (make-movie String String Number)
; Interp.: (make-movie t p y)
; Contains a movie's title (t),
; producer name p), and year released (y).

(define-struct person [name hair eyes phone])
; (make-person String String String Number)
; Interp.: (make-person n h e p) 
; Contains a person's name (n), hair color (h), eye color (e),
; and phone number (p)

(define-struct pet [name number])
; (make-pet String Number)
; Interp.: (make-move nam num)
; Contains a pet's name (nam) and number to contact if lost (num)

(define-struct CD [artist title price])
; (make-CD String String Number)
; Interp.: (make-CD a t p)
; Contains the CD artist (a), title (t), and price (p)

(define-struct sweater [material size producer])
; (make-sweater String String String)
; Interp.: (make-sweater m s p)
; Contains the material used to make the sweater (m),
; its size (s), and the price (p)
