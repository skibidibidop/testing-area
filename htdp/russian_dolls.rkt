#|
From: HTDP2e
Date: June 10, 2023

Code along - Russian Doll example.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct layer [color doll])
; a russ_doll is one of:
; - String
; - (make-layer String russ_doll)
; Interp.: represents nested russian dolls, with color being the color of the
; outer doll and doll being the color of the inner doll


; FUNCTION DEFINITION //////////////////////////////////////////////////////////
