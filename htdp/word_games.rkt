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

; A Word is one of:
; - '()
; (cons Char Word)
; Interp.: a list of characters

; A Word_list is one of:
; - '()
; (cons Word Word_list)
; Interp.: a list of Words

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; String -> String_list
; Finds all anagrams of word s
(check-member-of (anagrams "cat")
                 (list "act" "cat")
                 (list "cat" "act"))

(check-satisfied (anagrams "rat")
                 all_rat_anagrams?)

(define (anagrams s)
  (in_dict
   (words->strings (arrangements (string->word s)))))

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

; Word_list -> String_list
; Turns all Words in wlist into Strings
(check-expect (words->strings '()) '())
(check-expect (words->strings
               (list (list "h" "i")
                     (list "h" "e" "y")
                     (list "o" "h")))
              (list "hi" "hey" "oh"))

(define (words->strings wlist)
  (cond
    [(empty? wlist) '()]
    [else
     (cons (word->string (first wlist))
           (words->strings (rest wlist)))]))

; String_list -> String_list
; Picks out all the Strings that occur in the dictionary
(define (in_dict str_list) '())

; String -> Word
; Converts s to the chosen word representation
(check-expect (string->word "hey!")
              (list "h" "e" "y" "!"))

(define (string->word s)
  (explode s))

; Word -> String
; Converts w to a String
(check-expect (word->string '()) "")
(check-expect (word->string (list "h" "i" "!"))
              "hi!")

(define (word->string w)
  (cond
    [(empty? w) ""]
    [else
     (implode w)]))