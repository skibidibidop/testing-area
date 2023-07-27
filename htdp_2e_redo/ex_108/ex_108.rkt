#|
Author: Mark Beltran
Date: July 27, 2023

Exercise 108. In its default state, a pedestrian crossing light shows an
orange person standing on a red background. When it is time to allow the
pedestrian to cross the street, the light receives a signal and switches to a
green, walking person. This phase lasts for 10 seconds. After that the light
displays the digits 9, 8, ..., 0 with odd numbers colored orange and even
numbers colored green. When the countdown reaches 0, the light switches
back to its default state.

Design a world program that implements such a pedestrian traffic light.
The light switches from its default state when you press the space bar on
your keyboard. All other transitions must be reactions to clock ticks. You
may wish to use the following images or you can make up your own
stick figures with the image library.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 1)
(define SCN_SIZE (* SCALER 150))

(define )

; DATA DEFINITION //////////////////////////////////////////////////////////////



; FUNCTIONS ////////////////////////////////////////////////////////////////////
