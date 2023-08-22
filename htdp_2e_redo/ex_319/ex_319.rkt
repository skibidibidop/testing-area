#|
Author: Mark Beltran
Date: August 22, 2023

Exercise 319. Design substitute. It consumes an S-expression s and
two symbols, old and new. The result is like s with all occurrences of old
replaced by new.
|#

; This is just the solution from Figure 120

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An S-expr is one of:
; Atom
; [List-of S-expr]

; An Atom is one of:
; Number
; String
; Symbol

; S-expr Symbol Atom -> S-expr
; replaces all occurrences of old in sexp with new
(check-expect (substitute '(((world) bye) bye) 'bye '42)
              '(((world) 42) 42))
(check-expect (substitute '() 'bye '42) '())
(check-expect (substitute "hey" "hey" "hi") "hey")
(check-expect (substitute "hey" "hi" "hello") "hey")

(define (substitute sexp old new)
  (local (; S-expr -> Boolean
          (define (atom? in)
            (or (string? in)
                (number? in)
                (symbol? in)))

          ; S-expr -> S-expr
          (define (for-sexp sexp)
            (cond
              [(atom? sexp) (for-atom sexp)]
              [else (for-sl sexp)]))
          ; SL -> S-expr
          (define (for-sl sl)
            (cond
              [(empty? sl) '()]
              [else (cons (for-sexp (first sl))
                          (for-sl (rest sl)))]))
          ; Atom -> S-expr
          (define (for-atom at)
            (cond
              [(number? at) at]
              [(string? at) at]
              [(symbol? at) (if (equal? at old) new at)])))
    (for-sexp sexp)))


