;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex_19) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 19.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Position is a Number between 0 and a String's length

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; String Position -> String
; Inserts "_" at the ith position of str
(define WRONG_USE_MSG1
  "Enter a number between 0 and the string's length (inclusive).")
(define WRONG_USE_MSG2
  "Empty strings are not allowed.")
(define WRONG_USE_MSG (string-append WRONG_USE_MSG1 " " WRONG_USE_MSG2))

(check-expect (str_ins "" 3) WRONG_USE_MSG)
(check-expect (str_ins "hi" 5) WRONG_USE_MSG)
(check-expect (str_ins "hey" -3) WRONG_USE_MSG)
(check-expect (str_ins "hi" 0) "_hi")
(check-expect (str_ins "hi" 1) "h_i")
(check-expect (str_ins "hi" 2) "hi_")

(define (str_ins str i)
  (cond
    [(or (> i (string-length str))
         (< i 0)
         (string=? str ""))
     WRONG_USE_MSG]
    [else
     (string-append (substring str 0 i)
                    "_"
                    (substring str i))]))