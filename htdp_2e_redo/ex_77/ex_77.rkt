#|
Author: Mark Beltran
Date: July 21, 2023

Exercise 77. Provide a structure type definition and a data definition
for representing points in time since midnight. A point in time consists of
three numbers: hours, minutes, and seconds.
|#

(define-struct since_mnight [hr min sec])
; (make-since_mnight Number Number Number)
; Interp.: (make-since_mnight h m s)
; Represents the hours (h), minutes (m), and seconds (s) that have elapsed
; since midnight.
