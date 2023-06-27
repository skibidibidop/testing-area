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

(require 2htdp/batch-io)

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define LOCATION "/usr/share/dict/words")

; A Dictionary is a String_list
(define AS_LIST (read-lines LOCATION))

; A String_list is one of:
; - '()
; - (cons String String_list)
; Interp.: a list of strings
(define sl1 '())
(define sl2 (cons "hi" (cons "hello" '())))

; A Word is one of:
; - '()
; (cons 1String Word)
; Interp.: a list of characters
(define w1 '())
(define w2 (list "h" "e" "y" "!"))

; A Word_list is one of:
; - '()
; (cons Word Word_list)
; Interp.: a list of Words
(define wl1 '())
(define wl2 (list (list "h" "i")
                  (list "o" "h")))

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
(check-expect (arrangements '()) (list '()))
(check-expect (arrangements (list "e" "d"))
              (list "ed" "de"))

(define (arrangements w)
  (cond
    [(empty? w) '()]
    [else
     (insert_everywhere/in_all_words
      (first w)
      (arrangements (rest w)))]))

; 1String Word_list -> Word_list
; Produces a Word_list with ltr inserted before wlist, in between
; every 1String in wlist, and at the end of wlist
(check-expect (insert_everywhere/in_all_words "t" '()) '())
(check-expect (insert_everywhere/in_all_words "t" (list (list "a")))
              (list (list "t" "a")
                    (list "a" "t")))
(check-expect (insert_everywhere/in_all_words "t" (list (list "a" "b")
                                                        (list "b" "a")))
              (list (list "t" "a" "b")
                    (list "a" "t" "b")
                    (list "a" "b" "t")
                    (list "t" "b" "a")
                    (list "b" "t" "a")
                    (list "b" "a" "t")))

(define (insert_everywhere/in_all_words ltr wlist)
  (cond
    [(empty? wlist) '()]
    [else
     (cons
      (combine ltr
               (reverse (accumulate (first wlist)))
               (get_right (first wlist)))
      (insert_everywhere/in_all_words ltr (rest wlist)))]))

; Letter Word Word -> Word_list
; Creates a list by appending elements of l_list, ltr, and elements
; of r_list
(check-expect (combine "t"
                       (list (list '())
                             (list "a")
                             (list "a" "b")
                             (list "a" "b" "c"))
                       (list (list "a" "b" "c")
                             (list "b" "c")
                             (list "c")
                             (list '())))
              (list (list '() "t" "a" "b" "c")
                    (list "a" "t" "b" "c")
                    (list "a" "b" "t" "c")
                    (list "a" "b" "c" "t" '())))

(define (combine ltr l_list r_list)
  (cond
    [(or (empty? l_list) (empty? r_list)) '()]
    [else
     (cons (append (first l_list)
                   (list ltr)
                   (first r_list))
           (combine ltr (rest l_list) (rest r_list)))]))

; Word -> Word_list
; Creates a list that represents the part to the right of the Letter during
; each insertion.
(define (get_right w) '())

; Word -> Word_list
; Creates a list that represents the part to the left of the Letter during
; each insertion.
(define (accumulate w) '())

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
(check-expect (in_dict '()) '())
(check-expect (in_dict (list "zdx" "ASL" "Benetton" "asdf"))
              (list "ASL" "Benetton"))

(define (in_dict str_list)
  (cond
    [(empty? str_list) '()]
    [else
     (if (member? (first str_list) AS_LIST)
         (cons (first str_list) (in_dict (rest str_list)))
         (in_dict (rest str_list)))]))

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
    [(empty? (first w))
     (string-append "" (word->string (rest w)))]
    [else
     (string-append (first w) (word->string (rest w)))]))