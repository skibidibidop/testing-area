#|
Author: Mark Beltran
Date: May 20, 2023

Simulation of a rudimentary traffic light system.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define red_light (circle 10 "solid" "red"))
(define green_light (circle 10 "solid" "green"))
(define yellow_light (circle 10 "solid" "yellow"))
