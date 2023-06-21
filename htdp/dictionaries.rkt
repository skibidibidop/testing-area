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

; A String_list is one of:
; - '()
; - (cons String string_list)
; Interp.: a list of Strings

; A Ltr_list is one of:
; - '()
; (cons Letter Ltr_list)
; Interp.: a list of Letters

; A Letter is a member of this list:
(define LETTERS
  (explode "abcdefghijklmnopqrstuvwxyz"))

(define-struct ltr_counts [letter count])
; (make-ltr_counts Letter Number)
; Interp.: (make-ltr ltr count), contains the number of times (count) a
; letter (ltr) is used as the first character of a word in a Dictionary
; (define lc1 (make-ltr_counts "a" 5000))

; An Lcl (short for ltr_counts_list) is one of:
; - '()
; - (cons Ltr_counts Lcl)
; Interp.: a list of ltr_counts

; FUNCTION DEFINITION //////////////////////////////////////////////////////////

; Letter Dictionary -> Number
; Counts the numbers of words in dict that start with letter ltr
(check-expect (starts_with# "a" '()) 0)
(check-expect (starts_with# "e" AS_LIST) 3307)
(check-expect (starts_with# "z" AS_LIST) 151)

(define (starts_with# ltr dict)
  (cond
    [(empty? dict) 0]
    [else
     (if (string=? (first (explode (first dict))) ltr)
         (+ (starts_with# ltr (rest dict)) 1)
         (starts_with# ltr (rest dict)))]))

; Dictionary -> Lcl
; Counts the number of times each Letter is used as the first character of a
; word in a Dictionary.
(define SAMPLE_DICT1 (list "aa" "ba" "bb" "ca" "cb" "cc"))

(check-expect (count_by_letter '()) '())
(check-expect (count_by_letter SAMPLE_DICT1)
              (list
               (make-ltr_counts "a" 1)
               (make-ltr_counts "b" 2)
               (make-ltr_counts "c" 3)
               (make-ltr_counts "d" 0)
               (make-ltr_counts "e" 0)
               (make-ltr_counts "f" 0)
               (make-ltr_counts "g" 0)
               (make-ltr_counts "h" 0)
               (make-ltr_counts "i" 0)
               (make-ltr_counts "j" 0)
               (make-ltr_counts "k" 0)
               (make-ltr_counts "l" 0)
               (make-ltr_counts "m" 0)
               (make-ltr_counts "n" 0)
               (make-ltr_counts "o" 0)
               (make-ltr_counts "p" 0)
               (make-ltr_counts "q" 0)
               (make-ltr_counts "r" 0)
               (make-ltr_counts "s" 0)
               (make-ltr_counts "t" 0)
               (make-ltr_counts "u" 0)
               (make-ltr_counts "v" 0)
               (make-ltr_counts "w" 0)
               (make-ltr_counts "x" 0)
               (make-ltr_counts "y" 0)
               (make-ltr_counts "z" 0)))
               
(define (count_by_letter dict)
  (cond
    [(empty? dict) '()]
    [else (lcl_maker LETTERS dict)]))

; Ltr_list Dictionary -> lcl
; Creates a list of Ltr_counts based on provided Dictionary
(check-expect (lcl_maker
               (list "a" "b" "c") SAMPLE_DICT1)
              (list
               (make-ltr_counts "a" 1)
               (make-ltr_counts "b" 2)
               (make-ltr_counts "c" 3)))

(define (lcl_maker llist dict)
  (cond
    [(empty? llist) '()]
    [else
     (cons (make-ltr_counts (first llist)
                            (starts_with# (first llist) dict))
           (lcl_maker (rest llist) dict))]))

; Dictionary -> Ltr_counts
; Produces the ltr_counts structure of the most frequent first letter
; in the provided dictionary
(check-expect (most_frequent SAMPLE_DICT1) (make-ltr_counts "c" 3))

(define (most_frequent dict)
  (make-ltr_counts "a" 0))