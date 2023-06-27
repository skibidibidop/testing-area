;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname word_games_redo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 27, 2023

Redoing the Word Games project.
|#

(require 2htdp/batch-io)

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define DICT_LOC "/usr/share/dict/words")

; A Dictionary is a String_list
(define AS_LIST (read-lines DICT_LOC))

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
  (in_dict
   (words->strings (arrangements (string->word s)))))

; String_list -> Boolean
(define (all_words_from_rat? w)
  (and (member "rat" w)
       (member "tar" w)
       (member "art" w)))

; Word -> Word_list
; Produces all rearrangements of Word w
(check-expect (arrangements '()) '())
(check-expect (arrangements (list "a"))
              (list (list "a")))
(check-expect (arrangments (list "a" "b"))
              (list (list "a" "b")
                    (list "b" "a")))
(check-expect (arrangements (list "a" "b" "c"))
              (list (list "a" "b" "c")
                    (list "a" "c" "b")
                    (list "b" "a" "c")
                    (list "b" "c" "a")
                    (list "c" "a" "b")
                    (list "c" "b" "a")))

(define (arrangements w) '())

; String -> Word
; Converts String s to Word
(check-expect (string->word "") '())
(check-expect (string->word "hi!") (list "h" "i" "!"))

(define (string->word s)
  (explode s))

; Word -> String
; Converts Word w to String
(check-expect (word->string '()) "")
(check-expect (word->string (list "h" "e" "y"))
              "hey")

(define (word->string w)
  (implode w))

; Word_list -> String_list
; Converts all Words in Word_list wl to Strings
(check-expect (words->strings '()) '())
(check-expect (words->strings (list (explode "hi!")
                                    (explode "hello")))
              (list "hi!" "hello"))

(define (words->strings wl)
  (cond
    [(empty? wl) '()]
    [else
     (cons (word->string (first wl))
           (words->strings (rest wl)))]))

; String_list -> String_list
; Picks out all Strings in String_list sl that occur in the dictionary
(check-expect (in_dict '()) '())
(check-expect (in_dict (list "zdx" "ASL" "Benetton" "asdf"))
              (list "ASL" "Benetton"))

(define (in_dict sl)
  (cond
    [(empty? sl) '()]
    [else
     (if (member? (first sl) AS_LIST)
         (cons (first sl) (in_dict (rest sl)))
         (in_dict (rest sl)))]))