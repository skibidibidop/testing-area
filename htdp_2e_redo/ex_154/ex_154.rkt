#|
Author: Mark Beltran
Date: August 2, 2023

Exercise 154. Design the function colors. It consumes a Russian doll
and produces a string of all colors, separated by a comma and a space. Thus
our example should produce

"yellow, green, red"
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An RD (short for Russian doll) is one of:
; -- String
; -- (make-layer String RD)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; RD -> String
; Produces a String of all colors in RD rus_dol
(check-expect (colors '()) "")
(check-expect (colors (list "red")) "red")
(check-expect (colors (list "yellow" "green")) "yellow, green")

(define (colors rus_dol)
  (cond
    [(empty? rus_dol) ""]
    [(empty? (rest rus_dol)) (first rus_dol)]
    [else
     (string-append (first rus_dol)
                    ", "
                    (colors (rest rus_dol)))]))
