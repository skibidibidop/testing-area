#|
Author: Mark Beltran
Date: August 2, 2023

Exercise 154. Design the function colors. It consumes a Russian doll
and produces a string of all colors, separated by a comma and a space. Thus
our example should produce

"yellow, green, red"
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct layer [color doll])
; An RD (short for Russian doll) is one of:
; -- String
; -- (make-layer String RD)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; RD -> String
; Produces a String of all colors in RD rus_dol
(check-expect (colors (make-layer "red" "blue")) "red, blue")
(check-expect (colors (make-layer "green"
                                  (make-layer "yellow" "purple")))
              "green, yellow, purple")

(define (colors rus_dol)
  (cond
    [(string? rus_dol) rus_dol]
    [(layer? rus_dol)
     (string-append
      (layer-color rus_dol) ", " (colors (layer-doll rus_dol)))]))
