#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 59. Finish the design of a world program that simulates the
traffic light FSA.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)
(define BULB_RAD SCALER)
(define BULB_OUTLINE_RAD (* SCALER 1.2))

(define BULB_OUTLINE (circle BULB_OUTLINE_RAD "outline" "black"))

(define CENTER (/ BULB_OUTLINE_RAD 2))
(define DIAMETER (* SCALER 2))

(define BG (empty-scene DIAMETER DIAMETER))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Traffic_light is one of:
; - "red"
; - "yellow"
; - "green"
; Interp.: represents a traffic light state. "red" for stop, "yellow" for
; slow down, and "green" for go.

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Traffic_light -> Traffic_light
; Yields the next state, given the current state cs
(define (tl_next cs) cs)

; Traffic_light -> Image
; Renders the current state cs as an Image
(check-expect (tl_render "red")
              (place-image
               (circle BULB_RAD "solid" "red")
               CENTER CENTER
               (place-image BULB_OUTLINE CENTER CENTER BG)))
(check-expect (tl_render "yellow")
              (place-image
               (circle BULB_RAD "solid" "yellow")
               CENTER CENTER
               (place-image BULB_OUTLINE CENTER CENTER BG)))
(check-expect (tl_render "green")
              (place-image
               (circle BULB_RAD "solid" "green")
               CENTER CENTER
               (place-image BULB_OUTLINE CENTER CENTER BG)))

(define (tl_render cs)
  (place-image
   (circle BULB_RAD "solid" cs)
   CENTER CENTER
   (place-image BULB_OUTLINE CENTER CENTER BG)))

; MAIN /////////////////////////////////////////////////////////////////////////

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (tl_sim state)
  (big-bang state
    [to-draw tl_render]
    [on-tick tl_next 1]))
