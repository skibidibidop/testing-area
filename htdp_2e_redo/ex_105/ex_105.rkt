#|
Author: Mark Beltran
Date: July 26, 2023

Exercise 105. Some program contains the following data definition:

; A Coordinate is one of:
; -- a NegativeNumber ; interpretation on the y axis, distance from top
; -- a PositiveNumber ; interpretation on the x axis, distance from left
; -- a Posn ; interpretation an ordinary Cartesian point

Make up at least two data examples per clause in the data definition. For
each of the examples, explain its meaning with a sketch of a canvas.
|#

; I am confused by the name "NegativeNumber" because of how the y-axis
; works in this language. A negative number for the y-coordinate would
; mean that the point will be out of the canvas.
(define Y_COORD -50)

; PositiveNumber
(define X_COORD 50)

; Posn sample
(define cart_point (make-posn 30 40))
