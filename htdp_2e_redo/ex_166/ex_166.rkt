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

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; LoW -> LoP
; Produces a List-of-paychecks out of a List-of-works
(define (wage*.v3 

