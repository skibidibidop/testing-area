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

(define SCALER 1)

(define SCN_SIZE (* SCALER 100))

(define BG (empty-scene SCN_SIZE SCN_SIZE))

(define EXPECTS_INITIAL 0)
(define EXPECTS_REST    1)
(define DONE            2)
(define ERROR           3)

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An Expecting is one of:
; EXPECTS_INITIAL
; EXPECTS_REST
; DONE
; ERROR
; Interp.:
; EXPECTS_INITIAL - initial state
; EXPECTS_REST    - state after initial
; DONE            - state when a (b|c)* d regex is matched
; ERROR           - state when a (b|c)* d regex is not matched at any point

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Expecting -> Image
; Renders image based on Expecting ex
(define (render ex) BG)

; Expecting KeyEvent -> Expecting
; Updates Expecting ex based on KeyEvent ke
(define (check_pattern ex ke) ex)

; Expecting -> Boolean
; Has the pattern been matched or is there an erronuous input
(define (end? ex) #false)

; MAIN /////////////////////////////////////////////////////////////////////////

(define (main state)
  (big-bang state
    [to-draw render]
    [on-key check_pattern]
    [stop-when end?]))