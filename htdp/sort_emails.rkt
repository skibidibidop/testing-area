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

(define (ela1 (make-email "Aname" 1 "Mess 1")))
(define (elb10 (make-email "Bname" 10 "Mess 2")))
(define (elc20 (make-email "Cname" 20 "Mess 3")))
(define (eld30 (make-email "Dname" 30 "Mess 4")))
(define sorted_email_list (list ela1 elb10 elc20 eld30))

; Email_list -> Email_list
; Sorts Email_list from oldest to latest.
(check-expect (sort_oton '()) '())
(check-expect (sort_oton (list ela1 elb10 elc20 eld30))
              sorted_email_list)
(check-expect (sort_oton (list eld30 elc20 elb10 ela1))
              sorted_email_list)

(define (sort_oton el) el)

; Email_list -> Email_list
; Sorts Email_list alphabetically based on sender's name
(check-expect (sort_alphab (list ela1 elb10 elc20 eld30))
              sorted_email_list)
(check-expect (sort_alphab (list eld30 elc20 elb10 ela1))
              sorted_email_list)

(define (sort_alphab el) el)
