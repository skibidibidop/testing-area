#|
Author: Mark Beltran
Date: May 24, 2023

One line text editor
|#

(require 2htdp/image)
(require 2htdp/universe)

(define scaler 10)
(define box_width (* scaler 20))
(define box_height (* scaler 2))
(define xcenter (/ box_width 2))
(define ycenter (/ box_height 2))
(define text_box (empty-scene box_width box_height))
(define cursor (rectangle 1 box_height "solid" "red"))

(define-struct editor [pre post])
; editor: a structure
; (make-editor string string)
; Interpretation: (make-editor l r)
; One line editor, visible text is
; (string-append left right), cursor is rendered
; between the two parts

; editor -> image
; Puts text image and cursor in text box. Cursor
; position is based on data from editor
(check-expect (render (make-editor "Hith" "ere!"))
              (place-image (beside (text "Hith" 16 "black")
                                   cursor
                                   (text "ere!" 16 "black"))
                           xcenter ycenter
                           text_box))

(define (render whole_txt)
  (place-image (beside (text (editor-pre whole_txt) 16 "black")
                        cursor
                        (text (editor-post whole_txt) 16 "black"))
               xcenter ycenter
               text_box))

(define input (make-editor "Testing1" "Testing2!"))

(render input)
