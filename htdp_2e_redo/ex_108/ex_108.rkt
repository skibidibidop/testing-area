;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_108) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
(define SCN_CENTER (/ SCN_SIZE 2))

(define BG (empty-scene SCN_SIZE SCN_SIZE))

(define SMALL_BOX_SIZE (* SCALER 100))
(define BIG_BOX_SIZE (* SCALER 130))
(define BIG_BOX_CENTER (/ BIG_BOX_SIZE 2))

(define ORANGE_BOX (square SMALL_BOX_SIZE "solid" "orange"))
(define RED_BOX (square BIG_BOX_SIZE "solid" "red"))

(define WAIT_SIGN (place-image ORANGE_BOX
                               BIG_BOX_CENTER BIG_BOX_CENTER
                               RED_BOX))
(define GO_SIGN (square BIG_BOX_SIZE "solid" "green"))

(define FONT_SIZE (* SCALER 100))

(define WAIT     10)
(define GO_START 11)
(define GO_END   20)
(define CD_START 0)
(define CD_END   9)

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Crossing_light is one of:
; WAIT
; [GO_START, GO_END]
; [CD_START, CD_END]
; Interp.: represents the different states of a crossing light (wait, go,
; and countdown)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Crossing_light -> Image
; Renders an image based on data from Crossing_light cl
(check-expect (render WAIT)
              (place-image WAIT_SIGN SCN_CENTER SCN_CENTER BG))
(check-expect (render GO_START)
              (place-image GO_SIGN SCN_CENTER SCN_CENTER BG))

(define (render cl) BG)

; Crossing_light -> Crossing_light
; Updates Crossing_light cl per tick
(define (time_step cl) cl)

; Crossing_light KeyEvent -> Crossing_light
; Updates Crossing_light cl based on KeyEvent ke
(define (control cl ke) cl)


; MAIN /////////////////////////////////////////////////////////////////////////

(define (main state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]
    [on-key control]))
