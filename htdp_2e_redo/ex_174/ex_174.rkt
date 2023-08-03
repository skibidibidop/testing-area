;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_174) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 174. Design a program that encodes text files numerically.
Each letter in a word should be encoded as a numeric three-letter string
with a value between 0 and 256. Figure 69 shows our encoding function for
single letters. Before you start, explain these functions.

(1) Use read-words/line to preserve the organization of the
file into lines and words.
(2) Read up on explode again.
|#

(require 2htdp/batch-io)

; 1String -> String
; converts the given 1String to a 3-letter numeric String
(check-expect (encode-letter "z") (code1 "z"))
(check-expect (encode-letter "\t")
              (string-append "00" (code1 "\t")))
(check-expect (encode-letter "a")
              (string-append "0" (code1 "a")))

(define (encode-letter s)
  (cond
    [(>= (string->int s) 100) (code1 s)]
    [(< (string->int s) 10)
     (string-append "00" (code1 s))]
    [(< (string->int s) 100)
     (string-append "0" (code1 s))]))

; 1String -> String
; converts the given 1String into a String
(check-expect (code1 "z") "122")

(define (code1 c)
  (number->string (string->int c)))

; What an annoying exercise

;
;
(define (string-from-lls lls)
  (cond
    [(empty? lls) "\n"]
    [else
     (string-append (string-from-ls (first lls))
                    (string-from-lls (rest lls)))]))

;
;
(define (string-from-ls ls)
  (cond
    [(empty? ls) ""]
    [else
     (string-append (first ls)
                    (string-from-ls (rest ls)))]))

;
;
(define (encode-string ls)
  (cond
    [(empty? ls) (encode-letter " ")]
    [else
     (string-append (encode-letter (first ls))
                    (encode-string (rest ls)))]))

(write-file
 "ttt_encoded.txt"
 (encode-string
  (explode (string-from-lls (read-words/line "ttt.txt")))))