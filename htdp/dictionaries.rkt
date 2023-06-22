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

(define (starts_with# ltr dict) ;<----------------------------------------------
  (cond
    [(empty? dict) 0]
    [else
     (if (string=? ltr (first (explode (first dict))))
         (+ (starts_with# ltr (rest dict)) 1)
         (starts_with# ltr (rest dict)))]))

; Dictionary -> Lc_list
; Counts how often each letter is used as a first character in Dictionary dict
(define (count_by_letter dict) '())