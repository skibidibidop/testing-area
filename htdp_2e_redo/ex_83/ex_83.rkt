#|
Author: Mark Beltran
Date: July 21, 2023

Exercise 83. Design the function render, which consumes an Editor
and produces an image.
The purpose of the function is to render the text within an empty scene
of 200 x 20 pixels. For the cursor, use a 1 x 20 red rectangle and for the
strings, black text of size 16.

You may wish to read up on beside, above, and such functions. When
you are happy with the looks of the image, use the expression as a test and
as a guide to the design of render.
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
                           
