;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_87) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 22, 2023

Exercise 87. Develop a data representation for an editor based on our
first idea, using a string and an index. Then solve the preceding exercises
again. Retrace the design recipe. Hint if you haven’t done so, solve the
exercises in chapter 2.1.

Note on Design Choices
The exercise is a first study of making design
choices. It shows that the very first design choice concerns the data repre-
sentation. Making the right choice requires planning ahead and weighing
the complexity of each. Of course, getting good at this is a question of
gaining experience.
|#

(require 2htdp/universe)
(require 2htdp/image)

(define SCALER     1)
(define SWIDTH     (* SCALER 200))
(define SHEIGHT    (* SCALER 20))

(define BG         (empty-scene SWIDTH SHEIGHT))
(define XCENTER    (/ SWIDTH 2))
(define YCENTER    (/ SHEIGHT 2))
  
(define CURSOR     (rectangle SCALER (* SCALER 20) "solid" "red"))
(define FONT_SIZE  (* SCALER 16))
(define FONT_COLOR "black")

(define FIRST_POS  0)
(define SECOND_POS 1)
(define CHAR_LIM   22)

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct editor [text index])
; (make-editor String Non_neg_int)
; Interp.: (make-editor "hi!" 2), represents the current text being edited
; ("hi!") and the index of the 1String to the right of the cursor

; A Non_neg_int is a non-negative integer

; A Valid_key is one of:
; "a" to "z"
; "A" to "Z"
; "left"
; "right"
; "\b"
; special characters (!, ?, *, ,, (, ), etc.)


; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Editor -> Image
; Produces an Image based on the data from Editor ed
(check-expect (render (make-editor "hi!" 2))
              (overlay/align "left" "center"
                             (beside
                              (text "hi" FONT_SIZE FONT_COLOR)
                              CURSOR
                              (text "!" FONT_SIZE FONT_COLOR))
                              BG))

(define (render ed)
  (overlay/align "left" "center"
                 (beside
                  (text (substring (editor-text ed)
                                   FIRST_POS (editor-index ed))
                        FONT_SIZE FONT_COLOR)
                  CURSOR
                  (text (substring (editor-text ed)
                                   (editor-index ed))
                        FONT_SIZE FONT_COLOR))
                 BG))

; Editor Valid_key -> Editor
; Updates Editor ed based on Valid_key vk
(define empty_ed (make-editor "" 0))
(define multi_ed (make-editor "!a2:" 1))

(check-expect (edit empty_ed "a")     (make-editor "a" 1))
(check-expect (edit empty_ed "B")     (make-editor "B" 1))
(check-expect (edit empty_ed "left")  empty_ed)
(check-expect (edit empty_ed "right") empty_ed)
(check-expect (edit empty_ed "\b")    empty_ed)
(check-expect (edit empty_ed "!")     (make-editor "!" 1))
(check-expect (edit empty_ed "\t")    empty_ed)
(check-expect (edit multi_ed "c")     (make-editor "!ca2:" 2))
(check-expect (edit multi_ed "D")     (make-editor "!Da2:" 2))
(check-expect (edit multi_ed "left")  (make-editor "!a2:" 0))
(check-expect (edit multi_ed "right") (make-editor "!a2:" 2))
(check-expect (edit multi_ed "\b")    (make-editor "a2:" 0))
(check-expect (edit multi_ed "*")     (make-editor "!*a2:" 2))
(check-expect (edit multi_ed "\r")    multi_ed)

(define (edit ed vk) ed)

; MAIN /////////////////////////////////////////////////////////////////////////