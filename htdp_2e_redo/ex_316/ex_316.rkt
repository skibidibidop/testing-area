#|
Author: Mark Beltran
Date: August 16, 2023

Exercise 316. Define the atom? function.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An Atom is one of:
; Number
; String
; Symbol

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Any -> Boolean
; Is a an Atom
(check-expect (atom? "hi!") #true)
(check-expect (atom? 1000) #true)
(check-expect (atom? 'z) #true)
(check-expect (atom? (make-posn 1 2)) #false)

(define (atom? a)
  (or (string? a)
      (number? a)
      (symbol? a)))
