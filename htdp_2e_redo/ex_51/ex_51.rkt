#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 51. Design a big-bang program that simulates a traffic light
for a given duration. The program renders the state of a traffic light as a
solid circle of the appropriate color, and it changes state on every clock tick.
What is the most appropriate initial state? Ask your engineering friends.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 20)

(define BULB_CONTAINER (circle (* SCALER 5) "outline" "black"))
(define BULB_RADIUS (* SCALER 4.8))

(define XCENTER (/ (image-width BULB_CONTAINER) 2))
(define YCENTER (/ (image-height BULB_CONTAINER) 2))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Light_state is one of:
; - "red"
; - "yellow"
; - "green"
; Interp.: each color represents a traffic light state. "red" for stop,
; "yellow" for slow down, "green" for go.

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Light_state -> Image
; Draws BULB on BULB_CONTAINER based on lstate
(check-expect (render "red") (place-image
                              (circle BULB_RADIUS "solid" "red")
                              XCENTER YCENTER BULB_CONTAINER))
(check-expect (render "yellow") (place-image
                                 (circle BULB_RADIUS "solid" "yellow")
                                 XCENTER YCENTER BULB_CONTAINER))
(check-expect (render "green") (place-image
                                (circle BULB_RADIUS "solid" "green")
                                XCENTER YCENTER BULB_CONTAINER))

(define (render lstate)
  (place-image
   (circle BULB_RADIUS "solid" lstate)
   XCENTER YCENTER BULB_CONTAINER))

; Light_state -> Light_state
; Updates Light_state per tick
(check-expect (time_step "red") "yellow")
(check-expect (time_step "yellow") "green")
(check-expect (time_step "green") "red")

(define (time_step lstate)
  (cond
    [(string=? lstate "red") "yellow"]
    [(string=? lstate "yellow") "green"]
    [(string=? lstate "green") "red"]
    [else lstate]))

; MAIN /////////////////////////////////////////////////////////////////////////

(define (main state)
  (big-bang state
    [to-draw render]
    [on-tick time_step 0.5]))

(main "red")
