;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sort_by_score) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 18, 2023

Sorts list of game players by score in descending order.
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

(define-struct gp [name score])
; A Gp (short for game player): (make-gp String Number)
; Interp.: (make-gp p s), represents a player p who has scored s points

; A Gp_list is one of:
; - '()
; - (cons gp gp_list)
; Interp.: a list of Gp structures
; (define gpl1 '())
; (define gpl2 (list (make-gp "Name1" 0)
;                    (make-gp "Name2" 10)))


; FUNCTIONS /////////////////////////////////////////////////////////

; Gp_list -> Gp_list
; Sorts gp_list by score in desscending order.
(define (sort_desc gpl) gpl)