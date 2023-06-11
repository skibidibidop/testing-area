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

; russ_doll -> Number
; Counts nested dolls
(check-expect (doll_count (make-layer "yellow" (make-layer "green" "red"))) 3)

(define (doll_count nested_dolls)
  (cond[(string? nested_dolls) 1]
       [else
         (+ (doll_count (layer-doll nested_dolls)) 1)]))
