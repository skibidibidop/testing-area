#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 39. Good programmers ensure that an image such as CAR can
be enlarged or reduced via a single change to a constant definition. We
started the development of our car image with a single plain definition:

(define WHEEL-RADIUS 5)

The definition of WHEEL-DISTANCE is based on the wheel’s radius. Hence,
changing WHEEL-RADIUS from 5 to 10 doubles the size of the car image.
This kind of program organization is dubbed single point of control, and
good design employs this idea as much as possible.
Develop your favorite image of an automobile so that WHEEL-RADIUS
remains the single point of control.
|#

