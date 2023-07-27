;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_109) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 27, 2023

Exercise 109. Design a world program that recognizes a pattern in a
sequence of KeyEvents. Initially the program shows a 100 by 100 white
rectangle. Once your program has encountered the first desired letter, it
displays a yellow rectangle of the same size. After encountering the final
letter, the color of the rectangle turns green. If any “bad” key event occurs,
the program displays a red rectangle.
The specific sequences that your program looks for start with "a", fol-
lowed by an arbitrarily long mix of "b" and "c", and ended by a "d".
Clearly, "acbd" is one example of an acceptable string; two others are
"ad" and "abcbbbcd". Of course, "da", "aa", or "d" do not match.
|#

(require 2htdp/image)
(require 2htdp/universe)



; DATA DEFINITION //////////////////////////////////////////////////////////////

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; MAIN /////////////////////////////////////////////////////////////////////////