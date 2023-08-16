#|
Code-along:
19.3 S-expressions

Sample Problem:
Design the function count, which determines
how many times some symbol occurs in some S-expression.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An S-expr is one of:
; -- Atom
; -- SL

; An Atom is one of:
; -- Number
; -- String
; -- Symbol

; An SL is one of:
; -- '()
; -- (cons S-expr SL)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; S-expr Symbol -> N
; Counts all occurrences of sy in sexp
(define (count sexp sy)
  0)
