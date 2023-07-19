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

(define SCALER 10)
(define SCN_WIDTH (* SCALER 10))
(define SCN_HEIGHT (* SCALER 10))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))
(define BULB_CONTAINER (circle (* SCALER 5) "outline" "black"))
(define BULB (circle (* SCALER 5) "solid" "red"))
(define TLIGHT
  (place-images
   (list BULB_CONTAINER BULB)
   (list (make-posn SCN_XCENTER SCN_YCENTER)
         (make-posn SCN_XCENTER SCN_YCENTER))
   BG))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Light_state is one of:
; - "red"
; - "yellow"
; - "green"
; Interp.: each color represents a traffic light state. "red" for stop,
; "yellow" for slow down, "green" for go.

; FUNCTIONS ////////////////////////////////////////////////////////////////////
