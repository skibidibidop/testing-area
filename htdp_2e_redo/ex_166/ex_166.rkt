#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 166. The wage*.v2 function consumes a list of work records
and produces a list of numbers. Of course, functions may also produce lists
of structures.

Develop a data representation for paychecks. Assume that a paycheck
contains two distinctive pieces of information: the employee’s name and an
amount. Then design the function wage*.v3. It consumes a list of work
records and computes a list of paychecks from it, one per record.

In reality, a paycheck also contains an employee number. Develop a
data representation for employee information and change the data definition
for work records so that it uses employee information and not just a
string for the employee’s name. Also change your data representation of
paychecks so that it contains an employee’s name and number, too. Finally,
design wage*.v4, a function that maps lists of revised work records
to lists of revised paychecks.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct paycheck [name amt])
; (make-paycheck String Number)
; Interp.: (make-paycheck n s), contains a person's name (n) and salary (s)

(define-struct work [employee rate hours])
; (make-work String Number Number)
; Interp.: (make-work n r h) combines the name n with the pay rate r and the
; number of hours h

; A LoW (short for List-of-works) is one of:
; '()
; (cons Work LoW)

; A LoP (short for List-of-paychecks) is one of:
; '()
; (cons Paycheck LoP)

(define-struct einfo [eid name age blood])
; (make-einfo Number String Number String
; Interp.: (make-einfo id n a b) contains an employee's ID number (id),
; name (n), age (a), and blood type (b)

(define-struct paycheck2 [eid name amt])
; (make-paycheck2 Number String Number)
; Interp.: (make-paycheck2 id n s) combines an employee's ID number (id),
; name (n), and salary (s)

(define-struct work2 [info rate hrs])
; (make-work2 Einfo Number Number)
; Interp.: (make-work2 i r h) combines an employee's Einfo (i), hourly rate
; (r), and hours worked (h)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; LoW -> LoP
; Produces a List-of-paychecks out of a List-of-works
(check-expect (wagev3 '()) '())
(check-expect (wagev3 (list (make-work "EMP0001" 12 80)))
              (list (make-paycheck "EMP0001" (* 12 80))))
(check-expect (wagev3 (list (make-work "EMP0001" 12 80)
                            (make-work "EMP0002" 40 40)))
              (list (make-paycheck "EMP0001" (* 12 80))
                    (make-paycheck "EMP0002" (* 40 40))))

(define (wagev3 wr)
  (cond
    [(empty? wr) '()]
    [else
     (cons
      (make-paycheck (work-employee (first wr))
                     (* (work-rate (first wr))
                        (work-hours (first wr))))
      (wagev3 (rest wr)))]))

