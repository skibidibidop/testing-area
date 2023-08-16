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

; [List-of FT] N -> Number
; Returns the average age of all child instances in the family forest
(check-expect (average_age ff1 1930) 4)
(check-expect (average_age ff2 1970) (/ 97 4))

(define (average_age lft year)
  (local
    [(define (total_age an_ft b)
       (cond
         [(no-parent? an_ft) 0]
         [else
          (+ (total_age (child-father an_ft) b)
             (total_age (child-mother an_ft) b)
             (- year (child-date an_ft))
             b)]))

     (define (count_persons an_ft b)
       (cond
         [(no-parent? an_ft) 0]
         [else
          (+ (count_persons (child-father an_ft) b)
             (count_persons (child-mother an_ft) b)
             1 b)]))]
    
    (/ (foldr total_age 0 lft)
       (foldr count_persons 0 lft))))
  
