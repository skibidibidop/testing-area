#|
Author: Mark Beltran
Date: August 16, 2023

Exercise 315. Design the function average-age. It consumes a family forest and
a year (N). From this data, it produces the average age of all child instances
in the forest.

Note
If the trees in this forest overlap, the result isn’t a true average because
some people contribute more than others. For this exercise, act as if
the trees don’t overlap.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct no-parent [])

(define NP (make-no-parent))

(define-struct child [father mother name date eyes])
; An FT (short for Family Tree) is one of:
; NP
; (make-child FT FT String N String)

; A [List-of FT] is one of:
; '()
; (cons FT [List-of FT])
; Interp.: represents a family forest

; Oldest Generation:
(define Carl (make-child NP NP "Carl" 1926 "green"))
(define Bettina (make-child NP NP "Bettina" 1926 "green"))

; Middle Generation:
(define Adam (make-child Carl Bettina "Adam" 1950 "hazel"))
(define Dave (make-child Carl Bettina "Dave" 1955 "black"))
(define Eva (make-child Carl Bettina "Eva" 1965 "blue"))
(define Fred (make-child NP NP "Fred" 1966 "pink"))

; Youngest Generation:
(define Gustav (make-child Fred Eva "Gustav" 1988 "brown"))

(define ff1 (list Carl Bettina))
(define ff2 (list Fred Eva))
(define ff3 (list Fred Eva Carl))

; FUNCTIONS ////////////////////////////////////////////////////////////////////


