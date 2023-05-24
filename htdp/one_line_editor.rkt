#|
Author: Mark Beltran
Date: May 24, 2023

One line text editor
|#

(define-struct editor [pre post])
; editor: a structure
; (make-editor string string)
; Interpretation: (make-editor left right)
; One line editor, visible text is
; (string-append left right), cursor is rendered
; between the two parts
