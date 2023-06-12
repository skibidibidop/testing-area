;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname structs_in_lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 12, 2023

Code-along: sample in 10.2 Structures in Lists
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

(define-struct work [emp rate hrs])
; (make-work String Number Number)
; Interp.: (make-work n r h) combines an employee's name (n), rate (r), and
; number of hours worked (h)

; A work_list is one of:
; - '()
; - (cons work work_list)
; Interp.: represents a list of work details (name, rate, hours) for a number of
; employees
; (define wl1 '())
; (define wl2 (cons (make-work "Mark" 12 40)))
; (define wl3 (cons (make-work "Mark" 12 40)
;                   (cons (make-work "Anthony" 15 80) '())))

; A num_list is one of:
; - '()
; - (cons Number num_list)
; Interp.: a list of numbers

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; work_list -> num_list
; Computes weekly wages for given records
(check-expect (wages '()) '())
(check-expect (wages (cons
                      (make-work "Mark" 12 40)
                      '()))
              (cons 480 '()))
(check-expect (wages (cons
                      (make-work "Mark" 12 40)
                      (cons
                       (make-work "Anthony" 15 35) '())))
              (cons 480 525 '()))

(define (wages worked) '())