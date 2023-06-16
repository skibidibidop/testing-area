;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname editor2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 16, 2023

Code-along: 10.4 Graphical Editor, Revisited
|#

(require 2htdp/image)
(require 2htdp/universe)

; CONSTANTS ////////////////////////////////////////////////////////////////////

(define SCALER 10)

(define EWIDTH (* SCALER 30))
(define EHEIGHT (* SCALER 5))
(define FONT_SIZE (* SCALER 3))
(define FONT_COLOR "black")

(define BG (empty-scene EWIDTH EHEIGHT))
(define CURSOR (rectangle 1 EHEIGHT "solid" "red"))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An Lo1s (short for List_of_1Strings) is one of:
; - '()
; - (cons 1String Lo1s)

(define-struct editor [pre post])
; Editor: (make-editor Lo1s Lo1s)
(define good
  (cons "g" (cons "o" (cons "o" (cons "d" '())))))
(define all
  (cons "a" (cons "l" (cons "l" '()))))
(define lla
  (cons "l" (cons "l" (cons "a" '()))))

(make-editor all good)
(make-editor lla good)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Lo1s -> Lo1s
; Produces a reverse version of the given list
(check-expect
 (rev (cons "a" (cons "b" (cons "c" '()))))
 (cons "c" (cons "b" (cons "a" '()))))

(define (rev l)
  (cond[(empty? l) '()]
       [else
        (list_append
         (rev (rest l)) (first l))]))

; Lo1s 1String -> Lo1s
; Adds 1String to end of Lo1s
(check-expect (list_append (cons "a" (cons "b" '())) "c")
              (cons "a" (cons "b" (cons "c" '()))))

(define (list_append ls char)
  (cond[(empty? ls) (cons char '())]
       [else
        (cons (first ls) (list_append (rest ls) char))]))

; String String -> Editor
; Produces an Editor out of 2 Strings
(define hello
  (cons "h" (cons "e" (cons "l" (cons "l" (cons "o" '()))))))
(define there
  (cons "t" (cons "h" (cons "e" (cons "r" (cons "e" '()))))))

(check-expect (create_editor "hello" "there")
              (make-editor hello there))

(define (create_editor pre post)
  (make-editor (explode pre)
               (explode post)))

; Editor -> Image
; Renders image of text separated by a cursor
(define (render in_editor) BG)

; Editor KeyEvent -> Editor
; Deals with a KeyEvent, given some Editor
(define (khandler in_editor ke) in_editor)

; MAIN /////////////////////////////////////////////////////////////////////////

; String -> Editor
; Launches the editor given some initial string
(define (main str)
  (big-bang (create_editor str "")
    [to-draw render]
    [on-key khandler]))