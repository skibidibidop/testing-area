;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex_20) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 18, 2023

Exercise 20.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Position is a Number between 0 and the String's length (exclusive).

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; String Position -> String
; Deletes the character in the ith position of str.
(define WRONG_USE_MSG1 "No empty strings. Provide a number between")
(define WRONG_USE_MSG2 " 0 and the string's length (exclusive)")
(define WRONG_USE_MSG (string-append WRONG_USE_MSG1 WRONG_USE_MSG2))

(check-expect (str_del "" 3) WRONG_USE_MSG)
(check-expect (str_del "hi" 5) WRONG_USE_MSG)
(check-expect (str_del "hi" -5) WRONG_USE_MSG)
(check-expect (str_del "hi" 0) "i")
(check-expect (str_del "hi" 1) "h")

(define (str_del str i)
  (cond
    [(or (string=? str "")
         (>= i (string-length str))
         (< i 0))
     WRONG_USE_MSG]
    [else
     (string-append (substring str 0 i)
                    (substring str (+ i 1)))]))