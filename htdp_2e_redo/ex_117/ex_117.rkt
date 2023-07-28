#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 117. Consider the following sentences:

1. (3 + 4)
2. number?
3. (x)

Explain why they are syntactically illegal.
|#

; (3 + 4) : the operator needs to be put immediately
; after the open parenthesis
; This should be corrected to (+ 3 4)

; number? : function invocations need to be enclosed in parentheses

; (x) : variables don't need to be enclosed in parentheses if
; not invoked with a function
