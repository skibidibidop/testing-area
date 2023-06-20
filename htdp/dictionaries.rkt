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
(define SAMPLE_DICT2 (list "aa" "ab" "ac" "ba" "ca" "cc" "cd" "ce"))

(check-expect (count_by_letter '()) '())
(check-expect (count_by_letter SAMPLE_DICT1)
              (list
               (make-ltr_counts "a" 1)
               (make-ltr_counts "b" 2)
               (make-ltr_counts "c" 3)))
(check-expect (count_by_letter SAMPLE_DICT2)
              (list
               (make-ltr_counts "a" 3)
               (make-ltr_counts "b" 1)
               (make-ltr_counts "c" 4)))

(define (count_by_letter dict)
  (cond
    [(empty? dict) '()]
    [else (lcl_maker (get_firsts dict) dict)]))

; Dictionary -> Ltr_list
; Creates a list (set) of all first letters in provided Dictionary
(check-expect (get_firsts '()) '())
(check-expect (get_firsts SAMPLE_DICT1) (list "a" "b" "c"))
(check-expect (get_firsts SAMPLE_DICT2) (list "a" "b" "c"))

(define (get_firsts dict)
  (cond
    [(empty? dict) '()]
    [else
     (if (not (string=? (first dict)
                        (first (rest dict))))
         (cons (first dict))
         (cons (get_firsts (rest dict))))]))

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