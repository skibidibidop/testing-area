#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 136. Validate with DrRacket’s stepper

(our-first (our-cons "a" '())) == "a"
(our-rest (our-cons "a" '())) == '()

See chapter 8.2 for the definitions of these functions.
|#

(define-struct pair [left right])
; A ConsPair is a structure:
; (make-pair Any Any).

; A ConsOrEmpty is one of:
; -- '()
; -- (make-pair Any ConsOrEmpty)
; interpretation ConsOrEmpty is the class of all lists ; Any Any -> ConsOrEmpty
(define (our-cons a-value a-list)
  (cond
    [(empty? a-list) (make-pair a-value a-list)]
    [(pair? a-list) (make-pair a-value a-list)]
    [else (error "cons: second argument ...")]))


; ConsOrEmpty -> Any
; extracts the left part of the given pair
(define (our-first a-list)
  (if (empty? a-list)
      (error 'our-first "...")
      (pair-left a-list)))

; ConsOrEmpty -> Any
; Extract the right part of the given pair
(define (our-rest a-list)
  (if (empty? a-list)
      (error 'our-first "...")
      (pair-right a-list)))


(our-first (our-cons "a" '()))

(our-rest (our-cons "a" '()))
