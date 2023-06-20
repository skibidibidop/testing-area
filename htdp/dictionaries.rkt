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
; Interp.: a list of Strings

; A Letter is a member of this list:
(define LETTERS
  (explode "abcdefghijklmnopqrstuvwxyz"))

; FUNCTION DEFINITION //////////////////////////////////////////////////////////

; Letter Dictionary -> Number
(define (starts_with# ltr dict) 3)