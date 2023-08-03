#|
Author: Mark Beltran
Date: August 4, 2023

Exercise 188. Design a program that sorts lists of emails by date:

(define-struct email [from date message])
; An Email Message is a structure:
; (make-email String Number String)
; interpretation (make-email f d m) represents text m
; sent by f, d seconds after the beginning of time

Also develop a program that sorts lists of email messages by name. To
compare two strings alphabetically, use the string<? primitive.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct email [from date message])
; An Email Message is a structure:
; (make-email String Number String)
; interpretation (make-email f d m) represents text m
; sent by f, d seconds after the beginning of time

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; List-of-email -> Boolean
; Checks if list l is sorted in descending order
(check-expect (sorted>? '()) #true)
(check-expect (sorted>? (list (make-email "Sender1" 100 "aaa")
                              (make-email "Sender2" 50  "bbb")
                              (make-email "Sender3" 20  "ccc"))) #true)
(check-expect (sorted>? (list (make-email "Sender1" 20  "aaa")
                              (make-email "Sender2" 50  "bbb"))) #false)

(define (sorted>? l)
  (cond
    [(empty? l) #true]
    [(empty? (rest l)) #true]
    [else
     (and (> (email-date (first l)) (email-date (first (rest l))))
          (sorted>? (rest l)))]))

; List-of-email -> List-of-email
; produces a sorted version of l
(check-expect (sort> '()) '())
(check-satisfied (sort> '()) sorted>?)
(check-satisfied (sort> (list (make-email "P1" 10 "aaa")
                              (make-email "P2" 20 "bbb")
                              (make-email "P3" 30 "ccc")))
                 sorted>?)
(check-satisfied (sort> (list (make-email "P1" 50 "aaa")
                              (make-email "P2" 80 "bbb")
                              (make-email "P3" 70 "ccc")
                              (make-email "P4" 60 "ddd")))
                 sorted>?)
(check-satisfied (sort> (list (make-email "P1" 50 "aaa")
                              (make-email "P2" 40 "bbb")
                              (make-email "P3" 30 "ccc")))
                 sorted>?)

(define (sort> l)
  (cond
    [(empty? l) '()]
    [(cons? l) (insert (first l) (sort> (rest l)))]))

; Email List-of-email -> List-of-email
; inserts an_email into the sorted List-of-email lem
(define (insert an_email lem)
  (cond
    [(empty? lem) (cons an_email '())]
    [else (if (>= (email-date an_email) (email-date (first lem)))
              (cons an_email lem)
              (cons (first lem) (insert an_email (rest lem))))]))

; List-of-email -> List-of-email
; Sorts l by name
(check-expect (sort-name '()) '())
(check-satisfied (sort-name
                  (list (make-email "P1" 10 "aaa")
                        (make-email "P2" 20 "bbb")
                        (make-email "P3" 30 "ccc"))) sorted>?)
(check-satisfied (sort-name
                  (list (make-email "P3" 50 "aaa")
                        (make-email "P2" 40 "bbb")
                        (make-email "P1" 30 "ccc"))) sorted>?)

(define (sort-name l)
  (cond
    [(empty? l) '()]
    [(cons? l) (insert-name (first l) (sort-name (rest l)))]))

; Email List-of-email -> List-of-email
; inserts an email into the sorted List-of-email lem
(define (insert-name an_email lem)
  (cond
    [(empty? lem) (cons an_email '())]
    [else
     (if (or (string>? (email-from an_email) (email-from (first lem)))
             (string=? (email-from an_email) (email-from (first lem))))
         (cons an_email lem)
         (cons (first lem) (insert an_email (rest lem))))]))
