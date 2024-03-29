;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname dictionaries) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 20, 2023

Project
Real-World Data: Dictionaries

Dictionary location: /usr/share/dict/words
|#

(require 2htdp/batch-io)

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define LOCATION "/usr/share/dict/words")

; A Dictionary is a string_list
(define AS_LIST (read-lines LOCATION))

; A Dict_list is one of:
; - '()
; - (cons Dictionary Dict_list)
; Interp.: a list of Dictionarys

; A string_list is one of:
; - '()
; - (cons String string_list)
; Interp.: a list of strings

; A Letter is one of the following 1Strings:
; - "a"
; - ...
; - "z"
; or a member of this list:
(define LETTERS (explode "abcdefghijklmnopqrstuvwxyz"))

; A Letter_list is one of:
; - '()
; - (cons Letter Letter_list)
; A list of Letters

(define-struct letter_count [letter count])
; (make-letter_count Letter Number)
; Interp.: (make-letter_count l c), the Letter l is used as a first character
; Number c times in a Dictionary
(define sample_lc (make-letter_count "a" 40))

; An Lc_list is one of:
; - '()
; - (cons Letter_count Lc_list)
; Interp.: a list of Letter_counts
(define lcl1 '())
(define lcl2 (list (make-letter_count "a" 40)
                   (make-letter_count "b" 58)))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

(define TEST_DICT1 (list "aa" "ba" "bb" "ca" "cb" "cc"))
(define TEST_DICT2 (list "aa" "ab" "ac" "ba" "bb" "ca"))
(define TEST_DICT3 (list "aa" "ab" "ac" "ba" "ca" "cb"))
  
; Letter Dictionary -> Number
; Counts the number of words in Dictionary dict that start with Letter ltr
(check-expect (starts_with# "a" '()) 0)
(check-expect (starts_with# "a" TEST_DICT1) 1)
(check-expect (starts_with# "b" TEST_DICT2) 2)
(check-expect (starts_with# "h" TEST_DICT3) 0)
(check-expect (starts_with# "e" AS_LIST) 3307)
(check-expect (starts_with# "z" AS_LIST) 151)

(define (starts_with# ltr dict)
  (cond
    [(empty? dict) 0]
    [else
     (if (string=? ltr (first (explode (first dict))))
         (+ (starts_with# ltr (rest dict)) 1)
         (starts_with# ltr (rest dict)))]))

; Dictionary -> Lc_list
; Counts how often each letter is used as a first character in Dictionary dict
(check-expect (count_by_letter '()) '())
(check-expect (count_by_letter TEST_DICT3)
              (list (make-letter_count "a" 3)
                    (make-letter_count "b" 1)
                    (make-letter_count "c" 2)
                    (make-letter_count "d" 0)
                    (make-letter_count "e" 0)
                    (make-letter_count "f" 0)
                    (make-letter_count "g" 0)
                    (make-letter_count "h" 0)
                    (make-letter_count "i" 0)
                    (make-letter_count "j" 0)
                    (make-letter_count "k" 0)
                    (make-letter_count "l" 0)
                    (make-letter_count "m" 0)
                    (make-letter_count "n" 0)
                    (make-letter_count "o" 0)
                    (make-letter_count "p" 0)
                    (make-letter_count "q" 0)
                    (make-letter_count "r" 0)
                    (make-letter_count "s" 0)
                    (make-letter_count "t" 0)
                    (make-letter_count "u" 0)
                    (make-letter_count "v" 0)
                    (make-letter_count "w" 0)
                    (make-letter_count "x" 0)
                    (make-letter_count "y" 0)
                    (make-letter_count "z" 0)))

(define (count_by_letter dict)
  (cond
    [(empty? dict) '()]
    [else
     (count_firsts LETTERS dict)]))

; Letter_list Dictionary -> Lc_list
; Counts the number of times each Letter in Letter_list ltr_list is used as a
; first character in Dictionary dict
(define (count_firsts ltr_list dict)
  (cond
    [(empty? ltr_list) '()]
    [else
     (cons (make-letter_count (first ltr_list)
                              (starts_with# (first ltr_list) dict))
           (count_firsts (rest ltr_list) dict))]))

; Dictionary -> Letter_count
; Outputs the Letter_count of the Letter most used as the first character in
; Dictionary dict
(check-expect (most_frequent '()) '())
(check-expect (most_frequent TEST_DICT1) (make-letter_count "c" 3))
(check-expect (most_frequent TEST_DICT2) (make-letter_count "a" 3))
(check-expect (most_frequent TEST_DICT3) (make-letter_count "a" 3))

(define (most_frequent dict)
  (cond
    [(empty? dict) '()]
    [else
     (compare_counts (first (count_firsts LETTERS dict))
                     (rest (count_firsts LETTERS dict)))]))

; Letter_count Lc_list -> Letter_count
; Outputs the Letter_count in Lc_list lcl with the highest letter_count-count
(define (compare_counts lc lcl)
  (cond
    [(empty? lcl) lc]
    [else
     (if (>= (letter_count-count lc)
             (letter_count-count (first lcl)))
         (compare_counts lc (rest lcl))
         (compare_counts (first lcl) (rest lcl)))]))

; Dictionary -> Dict_list
; Produces a list of Dictionarys per Letter from the words in Dictionary dict
(check-expect (word_by_first_letter '()) '())
(check-expect (word_by_first_letter TEST_DICT1)
              (list
               (list "aa")
               (list "ba" "bb")
               (list "ca" "cb" "cc")))
(check-expect (word_by_first_letter TEST_DICT3)
              (list
               (list "aa" "ab" "ac")
               (list "ba")
               (list "ca" "cb")))

(define (word_by_first_letter dict)
  (cond
    [(empty? dict) '()]
    [else
     (dict_list_maker LETTERS dict)]))

; Letter_list Dict -> Dict_list
; Creates a list of Dictionarys sorted alphabetically, with each Dictionary
; only containing words starting from the same letter
(check-expect (dict_list_maker LETTERS '()) '())
(check-expect (dict_list_maker LETTERS TEST_DICT1)
              (list (list "aa")
                    (list "ba" "bb")
                    (list "ca" "cb" "cc")))

(define (dict_list_maker ltr_list dict)
  (cond
    [(empty? ltr_list) '()]
    [else
     (remove '()
             (cons (alpha_dict_maker (first ltr_list) dict)
                   (dict_list_maker (rest ltr_list) dict)))]))

; Letter Dictionary -> Dictionary
; Creates a Dictionary of words with the same starting letter
(check-expect (alpha_dict_maker "c" '()) '())
(check-expect (alpha_dict_maker "b" TEST_DICT1)
              (list "ba" "bb"))

(define (alpha_dict_maker ltr dict)
  (cond
    [(empty? dict) '()]
    [else
     (if (string=? ltr (first (explode (first dict))))
         (cons (first dict)
               (alpha_dict_maker ltr (rest dict)))
         (alpha_dict_maker ltr (rest dict)))]))
