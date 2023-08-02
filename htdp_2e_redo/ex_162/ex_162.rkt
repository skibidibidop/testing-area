#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 162. No employee could possibly work more than 100 hours
per week. To protect the company against fraud, the function should check
that no item of the input list of wage* exceeds 100. If one of them does, the
function should immediately signal an error. How do we have to change
the function in figure 64 if we want to perform this basic reality check?
|#

(define HOURLY_RATE 14)
(define WEEK_LIMIT 100)

(define ERR_MSG "No working for more than 100 hours per week.")

; DATA DEFINITION //////////////////////////////////////////////////////////////

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Number -> Number
; computes the wage for h hours of work
(check-error (wage 101) ERR_MSG)

(define (wage h)
  (cond
    [(> h WEEK_LIMIT) (error ERR_MSG)]
    [else
     (* HOURLY_RATE h)]))

; List-of-numbers -> List-of-numbers
; computes the weekly wages for all given weekly hours
(check-expect (wage* '()) '())
(check-expect (wage* (cons 28 '())) (cons (* 28 HOURLY_RATE) '()))
(check-expect (wage* (cons 4 (cons 2 '())))
              (cons (* 4 HOURLY_RATE) (cons (* 2 HOURLY_RATE) '())))

(define (wage* whrs)
  (cond
    [(empty? whrs) '()]
    [else (cons (wage (first whrs)) (wage* (rest whrs)))]))
