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

; FUNCTIONS ////////////////////////////////////////////////////////////////////


