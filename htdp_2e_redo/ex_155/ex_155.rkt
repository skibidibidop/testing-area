#|
Author: Mark Beltran
Date: August 2, 2023

Exercise 155. Design the function inner, which consumes an RD and
produces the (color of the) innermost doll. Use DrRacket’s stepper
to evaluate (inner rd) for your favorite rd
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct layer [color doll])
; An RD (short for Russian doll) is one of:
; -- String
; -- (make-layer String RD)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; RD -> String
; Returns the innermost color of RD rus_dol
(check-expect (inner (make-layer "red" "blue")) "blue")
(check-expect (inner
               (make-layer"red"
                           (make-layer "blue" "yellow")))
              "yellow")

(define (inner rus_dol)
  (cond
    [(string? rus_dol) rus_dol]
    [(layer? rus_dol)
     (inner (layer-doll rus_dol))]))
