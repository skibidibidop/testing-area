#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 127. Suppose the program contains

(define-struct ball [x y speed-x speed-y])

Predict the results of evaluating the following expression:

1. (number? (make-ball 1 2 3 4))
2. (ball-speed-y (make-ball (+ 1 2) (+ 3 3) 2 3))
3. (ball-y (make-ball (+ 1 2) (+ 3 3) 2 3))
4. (ball-x (make-posn 1 2))
5. (ball-speed-y 5)

Check your predictions in the interactions area and with the stepper.
|#

(define-struct ball [x y speed-x speed-y])

#|
1. (number? (make-ball 1 2 3 4))
#false

2. (ball-speed-y (make-ball (+ 1 2) (+ 3 3) 2 3))
3

3. (ball-y (make-ball (+ 1 2) (+ 3 3) 2 3))
(+ 3 3) or 6

4. (ball-x (make-posn 1 2))
Error, should be make-ball instead of make-posn

5. (ball-speed-y 5)
Error, need to provide struct ball
|#
