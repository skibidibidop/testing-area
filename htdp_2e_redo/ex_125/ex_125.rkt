#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 125. Discriminate the legal from the illegal sentences:

1. (define-struct oops [])
2. (define-struct child [parents dob date])
3. (define-struct (child person) [dob date])

Explain why the sentences are legal or illegal
|#

#|
1. Legal.
2. Legal, follows the format for define-struct.
3. Illegal, can't use a function as the struct name.
|#
