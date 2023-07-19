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

(require 2htdp/image)

(define WHEEL_RADIUS 10)
(define WHEEL_DIST (* WHEEL_RADIUS 2.5))

(define SWIDTH (* WHEEL_RADIUS 10))
(define SHEIGHT (* WHEEL_RADIUS 10))
(define XCENTER (/ SWIDTH 2))
(define YCENTER (/ SHEIGHT 2))

(define BG (empty-scene SWIDTH SHEIGHT))

(define BODY (rectangle SWIDTH (/ SHEIGHT 2) "solid" "red"))
(define WHEEL (circle (* WHEEL_RADIUS 2) "solid" "black"))

(define WHEEL_YPOS (- SHEIGHT WHEEL_RADIUS))

(place-images
 (list WHEEL
       WHEEL
       BODY)
 (list (make-posn (- XCENTER WHEEL_DIST) WHEEL_YPOS)
       (make-posn (+ XCENTER WHEEL_DIST) WHEEL_YPOS)
       (make-posn XCENTER (- SHEIGHT
                             (/ (image-height BODY) 2))))
 BG)
