#|
Author: Mark Beltran
Date: June 10, 2023

Extracts the colors of all dolls or inner-most doll in a nested doll.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct layer [col dol])
; a russ_doll is one of:
; - String
; - (make-layer String russ_doll)
; Interp.: represents nested Russian dolls, with col being the outer doll's
; color and dol being the inner doll's color
; (define rdoll1 "red")
; (define rdoll2 (make-layer "yellow" "red"))
; (define rdoll3 (make-layer "blue"
;                            (make-layer "yellow" "red")))

; FUNCTION DEFINITION //////////////////////////////////////////////////////////

; russ_doll -> String
; Produces a string of the colors of the nested dolls
(check-expect (colors "red") "red")
(check-expect (colors
               (make-layer "yellow" "red"))
              "yellow, red")
(check-expect (colors
               (make-layer "blue"
                           (make-layer "yellow" "red")))
              "blue, yellow, red")

(define (colors dolls)
  (cond[(string? dolls) dolls]
       [else
        (string-append (layer-col dolls)
                       ", "
                       (colors (layer-dol dolls)))]))

; russ_doll -> String
; Outputs the color of the innermost doll as a string.
(check-expect (inner_color "blue") "blue")
(check-expect (inner_color
               (make-layer "violet" "gold")) "gold")
(check-expect (inner_color
               (make-layer "magenta"
                           (make-layer "violet" "orange")))
              "orange")

(define (inner_color dolls)
  (cond[(string? dolls) dolls]
       [else (inner_color (layer-dol dolls))]))