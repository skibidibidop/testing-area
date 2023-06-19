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

(define ela1 (make-e_mail "Aname" 1 "Mess 1"))
(define elb10 (make-e_mail "Bname" 10 "Mess 2"))
(define elc20 (make-e_mail "Cname" 20 "Mess 3"))
(define eld30 (make-e_mail "Dname" 30 "Mess 4"))
(define sorted_email_list (list ela1 elb10 elc20 eld30))

; Email_list -> Email_list
; Sorts Email_list from oldest to latest.
(check-expect (sort_oton '()) '())
(check-expect (sort_oton (list ela1 elb10 elc20 eld30))
              sorted_email_list)
(check-expect (sort_oton (list eld30 elc20 elb10 ela1))
              sorted_email_list)

(define (sort_oton el)
  (cond
    [(empty? el) '()]
    [else
     (date_insert (first el) (sort_oton (rest el)))]))

; E_mail Email_list -> Email_list
; Inserts E_mail into sorted Email_list based on date
(check-expect (date_insert ela1 '()) (list ela1))
(check-expect (date_insert ela1 (list elb10 elc20 eld30))
              sorted_email_list)
(check-expect (date_insert elb10 (list ela1 elc20 eld30))
              sorted_email_list)
(check-expect (date_insert elc20 (list ela1 elb10 eld30))
              sorted_email_list)
(check-expect (date_insert eld30 (list ela1 elb10 elc20))
              sorted_email_list)

(define (date_insert em el)
  (cond
    [(empty? el) (list em)]
    [else
     (if (<= (e_mail-date em) (e_mail-date (first el)))
         (cons em el)
         (cons (first el) (date_insert em (rest el))))]))

; Email_list -> Email_list
; Sorts Email_list alphabetically based on sender's name
(check-expect (sort_alphab '()) '())
(check-expect (sort_alphab (list ela1 elb10 elc20 eld30))
              sorted_email_list)
(check-expect (sort_alphab (list eld30 elc20 elb10 ela1))
              sorted_email_list)

(define (sort_alphab el)
  (cond
    [(empty? el) '()]
    [else
     (alphab_insert (first el) (sort_alphab (rest el)))]))

; E_mail Email_list -> Email_list
; Inserts E_mail into sorted Email_list based on name of sender
(check-expect (alphab_insert ela1 '()) (list ela1))
(check-expect (alphab_insert ela1 (list elb10 elc20 eld30))
              sorted_email_list)
(check-expect (alphab_insert elb10 (list ela1 elc20 eld30))
              sorted_email_list)
(check-expect (alphab_insert elc20 (list ela1 elb10 eld30))
              sorted_email_list)
(check-expect (alphab_insert eld30 (list ela1 elb10 elc20))
              sorted_email_list)

(define (alphab_insert em el)
  (cond
    [(empty? el) (list em)]
    [else
     (if (string<? (e_mail-from em) (e_mail-from (first el)))
         (cons em el)
         (cons (first el) (alphab_insert em (rest el))))]))
