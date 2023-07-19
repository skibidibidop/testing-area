#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 48. Enter the definition of reward followed by (reward 18)
into the definitions area of DrRacket and use the stepper to find out how
DrRacket evaluates applications of the function.
|#

(define (reward s)
  (cond
    [(<= 0 s 10) "bronze"]
    [(and (< 10 s) (<= s 20)) "silver"]
    [else "gold"]))

(reward 18)
