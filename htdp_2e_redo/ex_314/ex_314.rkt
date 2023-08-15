#|
Author: Mark Beltran
Date: August 16, 2023

Exercise 314. Reformulate the data definition for FF with the List-of
abstraction. Now do the same for the blue-eyed-child-in-forest?
function. Finally, define blue-eyed-child-in-forest? using one of
the list abstractions from the preceding chapter.
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

; [List-of FT] -> Boolean
; does the forest contain any child with "blue" eyes
(check-expect (blue-eyed-child-in-forest? ff1) #false)
(check-expect (blue-eyed-child-in-forest? ff2) #true)
(check-expect (blue-eyed-child-in-forest? ff3) #true)

(define (blue-eyed-child-in-forest? a-forest)
  (cond
    [(empty? a-forest) #false]
    [else
     (or (blue-eyed-child? (first a-forest))
         (blue-eyed-child-in-forest? (rest a-forest)))]))

; FT -> Boolean
; does an-ftree contain a child
; structure with "blue" in the eyes field
(check-expect (blue-eyed-child? Carl) #false)
(check-expect (blue-eyed-child? Gustav) #true)

(define (blue-eyed-child? an-ftree)
  (cond
    [(no-parent? an-ftree) #false]
    [else (or (string=? (child-eyes an-ftree) "blue")
              (blue-eyed-child? (child-father an-ftree))
              (blue-eyed-child? (child-mother an-ftree)))]))

; [List-of FT] -> Boolean
; Redefines (blue-eyed-child-in-forest?) with ormap
(check-expect (becif2? ff1) #false)
(check-expect (becif2? ff2) #true)
(check-expect (becif2? ff3) #true)

(define (becif2? lft)
  (ormap blue-eyed-child? lft))
