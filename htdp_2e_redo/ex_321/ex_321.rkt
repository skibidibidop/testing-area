#|
Author: Mark Beltran
Date: August 18, 2023

Exercise 321. Abstract the data definitions for S-expr and SL so that
they abstract over the kinds of Atoms that may appear.
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

; ABSTRACTION //////////////////////////////////////////////////////////////////

; A [One-of S] is one of:
; [One-of A]
; [List-of [One-of S]]

; A [List-of [One-of S]] is one of:
; '()
; (cons [One-of S] [List-of [One-of S]])
