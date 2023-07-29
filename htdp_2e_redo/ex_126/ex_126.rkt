#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 126. Identify the values among the following expressions,
assuming the definitions area contains these structure type definitions:

(define-struct point [x y z])
(define-struct none [])

1. (make-point 1 2 3)
2. (make-point (make-point 1 2 3) 4 5)
3. (make-point (+ 1 2) 3 4)
4. (make-none)
5. (make-point (point-x (make-point 1 2 3)) 4 5)

Explain why the expressions are values or not.
|#

#|
1. (make-point 1 2 3)
(point-x) is 1
(point-y) is 2
(point-z) is 3

2. (make-point (make-point 1 2 3) 4 5)
(point-x) is (make-point 1 2 3)
(point-y) is 4
(point-z is 5

3. (make-point (+ 1 2) 3 4)
(point-x) is (+1 2)
(point-y) is 3
(point-z is 4

4. (make-none) has no selectors

5. (make-point (point-x (make-point 1 2 3)) 4 5)
(point-x) is 1 (the point-x of the inner make-point)
(point-y is 4
(point-z is 5
|#
