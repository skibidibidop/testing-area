#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 122. Suppose the program contains these definitions:

(define (f x y)
  (+ (* 3 x) (* y y)))

Show how DrRacket evaluates the following expressions, step-by-step:

1. (+ (f 1 2) (f 2 1))
2. (f 1 (* 2 3))
3. (f (f 1 (* 2 3)) 19)

Use DrRacket’s stepper to confirm your computations.
|#

(define (f x y)
  (+ (* 3 x) (* y y)))

#|
1. (+ (f 1 2) (f 2 1))

(+ (+ (* 3 1) (* 2 2))
   (+ (* 3 2) (* 1 1)))

(+ (+ 3 4) (+ 6 1))

(+ 7 7)

14
|#

#|
2. (f 1 (* 2 3))

(f 1 6)

(+ (* 3 1) (* 6 6))

(+ 3 36)

39
|#

#|
3. (f (f 1 (* 2 3)) 19)

(f (f 1 6) 19)

(f (+ (* 3 1) (* 6 6))
   19)

(f (+ 3 36) 19)

(f 39 19)

(+ (* 3 39) (* 19 19))

(+ 117 361)

478
|#
