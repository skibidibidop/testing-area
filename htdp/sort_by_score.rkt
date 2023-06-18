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
(define gp0 (make-gp "Name0" 0))
(define gp10 (make-gp "Name10" 10))
(define gp20 (make-gp "Name20" 20))
(define gp30 (make-gp "Name30" 30))

(check-expect (sort_desc '()) '())
(check-expect (sort_desc (list gp0 gp10 gp20 gp30))
              (list gp30 gp20 gp10 gp0))
(check-expect (sort_desc (list gp30 gp20 gp10 gp0))
              (list gp30 gp20 gp10 gp0))
(check-expect (sort_desc (list gp20 gp30 gp0 gp10))
              (list gp30 gp20 gp10 gp0))

(define (sort_desc gpl)
  (cond
    [(empty? gpl) ...]
    [else
     (...(first gpl)...
         (rest gpl)...)]))
    