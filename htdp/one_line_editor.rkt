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
              (place-image
               (beside
                (text "Hith" 16 "black")
                cursor
                (text "ere!" 16 "black"))
               xcenter ycenter
               text_box))

(define (render whole_txt)
  (place-image
   (beside
    (text (editor-pre whole_txt) 16 "black")
    cursor
    (text (editor-post whole_txt) 16 "black"))
   xcenter ycenter
   text_box))

; string -> string
; Removes the last character of a string
(check-expect (rmv_last "Hello") "Hell")
(define (rmv_last s)
  (substring s
             0
             (- (string-length s) 1)))

; editor keyevent -> editor
; If ke is \b, delete character to the left of the
; cursor (if any). If ke is a single character, add that
; character to the left of the cursor. If ke is "left" or
; "right", move cursor 1 character based on the direction
; if there are any characters left there.
(check-expect (edit (make-editor "This is " "a test") "\b")
              "This isa test!")
(define (edit ed ke)
  (cond[(string=? ke "\b") (make-editor
                            (rmv_last (editor-pre ed))
                            (
