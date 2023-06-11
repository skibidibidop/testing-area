#|
Author: Mark Beltran
Date: June 10, 2023

Extracts the colors of all dolls in a nested doll.
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

; 
