#|
Author: Mark Beltran
Date: August 17, 2023

Exercise 320. Reformulate the data definition for S-expr so that the first
clause is expanded into the three clauses of Atom and the second clause
uses the List-of abstraction. Redesign the count function for this data
definition.

Now integrate the definition of SL into the one for S-expr. Simplify
count again. Consider using lambda.

Note This kind of simplification is not always possible, but experienced
programmers tend to recognize such opportunities.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An S-expr is one of:
; Number
; String
; Symbol
; [List-of S-expr]

; An N is a Natural Number

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; S-expr Symbol -> N
; Counts all occurrences of sy in sexp
(check-expect (count 'world 'hello) 0)
(check-expect (count '(world hello) 'hello) 1)
(check-expect (count '(((world) hello) hello) 'hello) 2)

(define (count sexp sy)
  (local
    [; S-expr Symbol -> Boolean
     (define (symbol_match? exp sym)
       (if (symbol=? sym exp) 1 0))]
       
  (cond
    [(empty? sexp) 0]
    [(list? sexp)
     (+ (count (first sexp) sy)
        (count (rest sexp) sy))]
    [(symbol? sexp) (symbol_match? sexp sy)]
    [else 0])))
