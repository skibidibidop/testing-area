#|
Author: Mark Beltran
Date: August 12, 2023

Exercise 280. Calculate the result of the following expressions:

1. ((lambda (x y) (+ x (* x y)))
    1 2)

2. ((lambda (x y)
      (+ x
         (local ((define z (* y y)))
           (+ (* 3 z) (/ 1 x)))))
    1 2)

3. ((lambda (x y)
      (+ x
         ((lambda (z)
            (+ (* 3 z) (/ 1 z)))
          (* y y))))
    1 2)

Check your results in DrRacket.
|#
