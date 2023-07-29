#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 137. Compare the template for contains-flatt? with the one
for how-many. Ignoring the function name, they are the same. Explain the
similarity.
|#


(define (contains-flatt? alon)
  (cond
    [(empty? alon) ...]
    [(cons? alon)
     (... (first alon) ... (rest alon) ...)]))


; List-of-strings -> Number
; determines how many strings are on alos
(define (how-many alos)
  (cond
    [(empty? alos) ...]
    [else
     (... (first alos) ...
          ... (how-many (rest alos)) ...)]))

; They use the same parts of a list
