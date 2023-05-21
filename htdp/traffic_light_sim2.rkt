#|
Author: Mark Beltran
Date: May 21, 2023

Studying FSM/FSA by simulating traffic lights.
|#

(require 2htdp/universe)

; A TrafficLight is one of the following:
;
; Interpretation:

; TrafficLight -> TrafficLight
; Yields the next state based on
; the current state (cs)
(define (tl_next cs) ...)

; TrafficLight -> Image
; Renders current state as an image
(define (tl_render current_state)
  (empty-scene 90 30))

; TrafficLight -> TrafficLight
; Simulates a clock-based traffic light
(define (tl_sim init_state)
  (big-bang init_state
    [to-draw tl_render]
    [on-tick tl_next 0.5]))
