#|
Author: Mark Beltran
Date: May 16, 2023

Exercise 14
Print the last 1String.
|#

(define (last_char in)
  (string-ith in (- (string-length in) 1)))