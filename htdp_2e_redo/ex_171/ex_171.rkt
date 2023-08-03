;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_171) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: Aug 3, 2023

Exercise 171. You know what the data definition for List-of-strings
looks like. Spell it out. Make sure that you can represent Piet Hein’s poem
as an instance of the definition where each line is represented as a string
and another instance where each word is a string. Use read-lines and
read-words to confirm your representation choices.

Next develop the data definition for List-of-list-of-strings. Again, repre-
sent Piet Hein’s poem as an instance of the definition where each line is
represented as a list of strings, one per word, and the entire poem is a list
of such line representations. You may use read-words/line to confirm
your choice.

TTT
Put up in a place
where it's easy to see
the cryptic admonishment
T.T.T.
When you feel how depressingly
slowly you climb,
it's well to remember that
Things Take Time.

Piet Hein
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A List-of-string is one of:
; '()
; (cons String List-of-string)

(define poem1
  (list "TTT"
        "Put up in a place"
        "where it's easy to see"
        "the cryptic admonishment"
        "T.T.T."
        "When you feel how depressingly"
        "slowly you climb,"
        "it's well to remember that"
        "Things Take Time."
        "Piet Hein"))

; A List-of-list-of-strings is one of:
; '()
; (cons List-of-strings List-of-list-of-strings)

(define poem2
  (list
   (list "TTT")
   (list "Put" "up" "in" "a" "place")
   (list "where" "it's" "easy" "to" "see")
   (list "the" "cryptic" "admonishment")
   (list "T.T.T.")
   (list "When" "you" "feel" "how" "depressingly")
   (list "slowly" "you" "climb")
   (list "it's" "well" "to" "remember" "that")
   (list "Things" "Take" "Time.")
   (list "Piet" "Hein")))