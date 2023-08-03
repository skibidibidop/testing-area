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
