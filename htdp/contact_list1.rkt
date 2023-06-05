;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname contact_list1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 5, 2023

Design a function that consumes a list of contacts and checking if
it has "Flatt".
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; name_list is one of:
; - '()
; - (cons String name_list)
; Interp.: a list of names
; (define nl1 (cons '() '()))
; (define nl2 (cons "Name1" '()))
; (define nl3 (cons "Name1"
;                   (cons "Name2" '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; name_list -> Boolean
; determines whether "Flatt" is in a name_list
(define (has_flatt? nlist) #false)
(check-expect (has_flatt? '()) #false)
(check-expect (has_flatt? (cons "Find" '())) #false)
(check-expect (has_flatt? (cons "Flatt" '())) #true)
(check-expect (has_flatt? (cons "Find" (cons "Flatt" (cons "Huh" '())))) #true)
(check-expect (has_flatt? (cons "Find"
                                (cons "Huh" (cons "A" (cons "ASD" '())))))
              #false)