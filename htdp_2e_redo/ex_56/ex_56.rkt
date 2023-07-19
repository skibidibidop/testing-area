#|
Author: Mark Beltran
Date: July 20, 2023

Sample Problem
Design a program that launches a rocket when
the user presses the space bar. At that point, the simulation
starts a countdown for three ticks, before it displays the scenery
of a rising rocket. The rocket should move upward at a rate of
three pixels per clock tick.

Exercise 56. Define main2 so that you can launch the rocket and watch
it lift off. Read up on the on-tick clause to determine the length of one
tick and how to change it.
If you watch the entire launch, you will notice that once the rocket
reaches the top something curious happens. Explain. Add a stop-when
clause to main2 so that the simulation of the liftoff stops gracefully when
the rocket is out of sight.
|#

(require 2htdp/image)
(require 2htdp/universe)

; DATA DEFINITION //////////////////////////////////////////////////////////////


; FUNCTIONS ////////////////////////////////////////////////////////////////////
