#|
Author: Mark Beltran
Date: August 16, 2023

Exercise 314. Reformulate the data definition for FF with the List-of
abstraction. Now do the same for the blue-eyed-child-in-forest?
function. Finally, define blue-eyed-child-in-forest? using one of
the list abstractions from the preceding chapter.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An FF (short for Family Forest) is a [List-of FT]

(define-struct no-parent [])

(define NP (make-no-parent))

(define-struct child [father mother name date eyes])
; An FT (short for Family Tree) is one of:
; NP
; (make-child FT FT String N String)

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

; FUNCTIONS ////////////////////////////////////////////////////////////////////
