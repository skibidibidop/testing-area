#|
Author: Mark Beltran
Date: June 19, 2023

Sorts emails by date (no. of seconds since beginning of time) or name.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An Email_list is one of:
; - '()
; - (cons e_mail email_list)
; Interp.: A list of e_mail structures
; (define eml1 '())
; (define eml2
;   (list (make-e_mail "Name1" 500 "Hi!")
;         (make-e_mail "Name2" 40 "Hello!")))

(define-struct e_mail [from date message])
; (make-e_mail String Number String)
; Interp.: (make-email f d m)
; Represents text m sent by f, d seconds after the beginning of time

; FUNCTIONS ////////////////////////////////////////////////////////////////////
