#|
Author: Mark Beltran
Date: August 15, 2023

Exercise 311. Develop the function average-age. It consumes a family tree and
the current year. It produces the average age of all child structures in
the family tree.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct no-parent [])

(define NP (make-no-parent))

(define-struct child [father mother name date eyes])
; An FT (short for family tree) is one of:
; -- NP
; -- (make-child FT FT String N String)

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

; FT Number -> Number
; Returns the average age of all child structures in an_ftree
(check-expect (average_age Carl 1930) 4)
(check-expect (average_age Fred 1976) 10)
(check-expect (average_age Adam 1960) 26)
(check-expect (average_age Gustav 1990) 35.8)

(define (average_age an_ftree year)
  (local [(define (total_age ta_ftree)
            (cond
              [(no-parent? ta_ftree) 0]
              [else
               (+ (total_age (child-father ta_ftree))
                  (total_age (child-mother ta_ftree))
                  (- year (child-date ta_ftree)))]))
          (define (count_persons cp_ftree)
            (cond
              [(no-parent? cp_ftree) 0]
              [else
               (+ (count_persons (child-father cp_ftree))
                  (count_persons (child-mother cp_ftree)) 1)]))]
    (/ (total_age an_ftree) (count_persons an_ftree))))
