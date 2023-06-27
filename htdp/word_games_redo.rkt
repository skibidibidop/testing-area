;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname word_games_redo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 27, 2023

Redoing the Word Games project.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A String_list is one of:
; - '()
; - (cons String String_list)
; Interp.: a list of Strings

; A Word is one of:
; - '()
; - (cons 1String Word)
; Interp.: a list of 1Strings
(define w1 '())
(define w2 (list "a" "b" "c"))

; A Word_list is one of:
; - '()
; - (cons Word Word_list)
; - Interp.: a list of Words
(define wl1 '())
(define wl2 (list (list "a")
                  (list "b" "c")))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; String -> String_list
; Produces all anagrams of String s
(check-member-of (anagrams "cat")
                 (list "act" "cat")
                 (list "cat" "act"))
(check-satisfied (anagrams "rat")
                 all_words_from_rat?)

(define (anagrams s)
  ...)

; String_list -> Boolean
(define (all_words_from_rat? w)
  (and (member "rat" w)
       (member "tar" w)
       (member "art" w)))

; Word -> Word_list
; Produces all rearrangements of Word w
(define (arrangements w)
  ...)

; String -> Word
; Converts String s to Word
(define (string->word s)
  ...)

; Word -> String
; Converts Word w to String
(define (word->string w)
  ...)