;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname editor2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 16, 2023

Code-along: 10.4 Graphical Editor, Revisited
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An Lo1S (short for List_of_1Strings) is one of:
; - '()
; - (cons 1String Lo1S)

(define-struct editor [pre post])
; Editor: (make-editor Lo1S Lo1S)
(define good
  (cons "g" (cons "o" (cons "o" (cons "d" '())))))
(define all
  (cons "a" (cons "l" (cons "l" '()))))
(define lla
  (cons "l" (cons "l" (cons "a" '()))))

(make-editor all good)
(make-editor lla good)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Lo1S -> Lo1S
; Produces a reverse version of the given list
(check-expect
 (rev (cons "a" (cons "b" (cons "c" '()))))
 (cons "c" (cons "b" (cons "a" '()))))

(define (rev l) l)