;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex_313) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 15, 2023

Exercise 313. Suppose we need the function blue-eyed-ancestor?,
which is like blue-eyed-child? but responds with #true only when a
proper ancestor, not the given child itself, has blue eyes.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct no-parent [])

(define NP (make-no-parent))

(define-struct child [father mother name date eyes])
; An FT (short for family tree) is one of:
; -- NP
; -- (make-child FT FT String N String)

; Oldest Generation:
(define Carl (make-child NP NP "Carl" 1926 "green"))
(define Bettina (make-child NP NP "Bettina" 1926 "green"))

; Middle Generation:
(define Adam (make-child Carl Bettina "Adam" 1950 "hazel"))
(define Dave (make-child Carl Bettina "Dave" 1955 "black"))
(define Eva (make-child Carl Bettina "Eva" 1965 "blue"))
(define Fred (make-child NP NP "Fred" 1966 "pink"))

; Youngest Generation:
(define Gustav (make-child Fred Eva "Gustav" 1988 "brown"))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; FT -> Boolean
; Returns #true if an ancestor of the child has blue eyes
(check-expect (blue_eyed_ancestor Eva) #false)
(check-expect (blue_eyed_ancestor Gustav) #true)

; Now suppose a friend comes up with this solution:
(define (blue-eyed-ancestor? an-ftree)
  (cond
    [(no-parent? an-ftree) #false]
    [else
     (or
      (blue-eyed-ancestor?
       (child-father an-ftree))
      (blue-eyed-ancestor?
       (child-mother an-ftree)))]))

#|
Explain why this function fails one of its tests. What is the result of (blue-
eyed-ancestor? A) no matter which A you choose? Can you fix your
friend’s solution?
|#

