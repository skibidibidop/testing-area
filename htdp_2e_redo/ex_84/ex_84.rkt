#|
Author: Mark Beltran
Date: July 21, 2023

Exercise 84. Design edit. The function consumes two inputs, an editor ed
and a KeyEvent ke, and it produces another editor. Its task is to
add a single-character KeyEvent ke to the end of the pre field of ed, unless
ke denotes the backspace ("\b") key. In that case, it deletes the character
immediately to the left of the cursor (if there are any). The function ignores
the tab key ("\t") and the return key ("\r").

The function pays attention to only two KeyEvents longer than one letter:
"left" and "right". The left arrow moves the cursor one character
to the left (if any), and the right arrow moves it one character to the right
(if any). All other such KeyEvents are ignored.

Develop a goodly number of examples for edit, paying attention to
special cases. When we solved this exercise, we created 20 examples and
turned all of them into tests.

Hint: Think of this function as consuming KeyEvents, a collection that
is specified as an enumeration. It uses auxiliary functions to deal with the
Editor structure. Keep a wish list handy; you will need to design additional
functions for most of these auxiliary functions, such as stringfirst,
string-rest, string-last, and string-remove-last. If you haven’t done so,
solve the exercises in chapter 2.1.
|#

(require 2htdp/universe)
(require 2htdp/image)

(define SCALER 1)
(define SWIDTH (* SCALER 200))
(define SHEIGHT (* SCALER 20))

(define BG (empty-scene SWIDTH SHEIGHT))
(define XCENTER (/ SWIDTH 2))
(define YCENTER (/ SHEIGHT 2))
  
(define CURSOR (rectangle SCALER (* SCALER 20) "solid" "red"))
(define FONT_SIZE (* SCALER 16))
(define FONT_COLOR "black")

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct editor [pre post])
; An Editor is a structure:
; (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with
; the cursor displayed between s and t

; Develop the image for a sample string in DrRacket’s interactions area:
(overlay/align "left" "center"
               (text "hello world" 11 "black")
               (empty-scene 200 20))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Editor -> Image
; Produces an Image based on the data from the provided Editor
(check-expect (render (make-editor " " " "))
              (overlay/align "left" "center"
                             (beside
                              (text " " FONT_SIZE FONT_COLOR)
                              (text " " FONT_SIZE FONT_COLOR))
                             BG))

(define (render ed)
  (overlay/align "left" "center"
                 (beside
                  (text (editor-pre ed) FONT_SIZE FONT_COLOR)
                  (text (editor-post ed) FONT_SIZE FONT_COLOR))
                 BG))
                           
