;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname word_games) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 23, 2023

Project: Word Games

Notes:
Enumerate all anagrams from a provided word.
Remove duplicate strings in list of anagrams.

|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A String_list is one of:
; - '()
; - (cons String String_list)
; Interp.: a list of strings
(define sl1 '())
(define sl2 (cons "hi" (cons "hello" '())))

; A Word is ...

; A Word_list is ...

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; String -> String_list
; Finds all anagrams of word s
(check-satisfied (anagram "rat")
                 (all_rat_anagrams?))

(define (anagram s)
  ...)

; String_list -> Boolean
; Are all anagrams of "rat" in the list
(define (all_rat_anagrams? w)
  (and (member? "rat" w)
       (member? "tar" w)
       (member? "art" w)))

; Word -> Word_list
; Finds all arrangements of word
(define (arrangements word)
  (list word))