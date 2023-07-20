#|
Author: Mark Beltran
Date: July 21, 2023

Exercise 78. Provide a structure type and a data definition for representing
three-letter words. A word consists of lowercase letters, represented
with the 1Strings "a" through "z" plus #false

. Note This exercise is a
part of the design of a hangman game; see exercise 396.
|#

; A Low_letter is one of:
; "a"
; ...
; "z"

(define-struct three_let_word [first second third])
; (make-three_let_word Low_letter Low_letter Low_letter)
; Interp.: (make-three_let_word "h" "e" "y")
; Represents a three letter word
  
