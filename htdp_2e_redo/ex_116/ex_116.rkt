#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 116. Take a look at the following sentences:

1. x
2. (= y z)
3. (= (= y z) 0)

Explain why they are syntactically legal expressions
|#

; x is a variable
; (= y z) is an expression to check if y and z are equal
; (= (= y z) 0) also a legal expression that first checks
; if y and z are equal, and then checks if the result of
; that and 0 are equal
