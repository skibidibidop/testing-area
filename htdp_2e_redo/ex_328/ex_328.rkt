;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex_328) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 22, 2023

Exercise 328. Copy and paste figure 120 into DrRacket; include your
test suite. Validate the test suite. As you read along the remainder of this
section, perform the edits and rerun the test suites to confirm the validity
of our arguments.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An S-expr is one of:
; Atom
; [List-of S-expr]

; An Atom is one of:
; Number
; String
; Symbol

; Figure 120 ///////////////////////////////////////////////////////////////////

; S-expr Symbol Atom -> S-expr
; replaces all occurrences of old in sexp with new
(check-expect (substitute '(((world) bye) bye) 'bye '42)
              '(((world) 42) 42))
(check-expect (substitute '() 'bye '42) '())
(check-expect (substitute "hey" "hey" "hi") "hi")
(check-expect (substitute "hey" "hi" "hello") "hey")

(define (substitute sexp old new)
  (local 
    [; S-expr -> Boolean
     (define (atom? in)
       (or (string? in)
           (number? in)
           (symbol? in)))

     ; S-expr -> S-expr
     (define (for-sexp sexp)
       (cond
         [(atom? sexp)
          (if (equal? sexp old) new sexp)]
         [else
          (map for-sexp sexp)]))]
    
    (for-sexp sexp)))
