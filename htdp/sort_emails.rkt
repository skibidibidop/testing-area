#|
Author: Mark Beltran
Date: June 19, 2023

Sorts emails by date (no. of seconds since beginning of time) or name.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct e_mail [from date message])
; (make-e_mail String Number String)
; Interp.: (make-email f d m)
; Represents text m sent by f, d seconds after the beginning of time

; FUNCTIONS ////////////////////////////////////////////////////////////////////

