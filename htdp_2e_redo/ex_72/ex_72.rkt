#|
Author: Mark Beltran
Date: July 21, 2023

(define-struct phone [area number])

Exercise 72. Formulate a data definition for the above phone structure
type definition that accommodates the given examples.

Next formulate a data definition for phone numbers using this structure
type definition:

(define-struct phone# [area switch num])

Historically, the first three digits make up the area code, the next three the
code for the phone switch (exchange) of your neighborhood, and the last
four the phone with respect to the neighborhood. Describe the content of
the three fields as precisely as possible with intervals.
|#

(define-struct phone [area number])
; (make-phone Number Number)
; Interp.: contains the area code and the rest of a phone number
(make-phone 43 12345678)

(define-struct phone# [area switch num])
; (make-phone Number Number Number)
; Interp.: contains the area code (area), phone switch of the neighborhood,
; and the rest of the phone number
(make-phone 1 234 5478)
