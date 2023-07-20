;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_60) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 60. An alternative data representation for a traffic light
program may use numbers instead of strings:
; An N-TrafficLight is one of:
; -- 0 interpretation the traffic light shows red
; -- 1 interpretation the traffic light shows green
; -- 2 interpretation the traffic light shows yellow

It greatly simplifies the definition of tl-next:
; N-TrafficLight -> N-TrafficLight
; yields the next state, given current state cs
(define (tl-next-numeric cs) (modulo (+ cs 1) 3))

Reformulate tl-next’s tests for tl-next-numeric.
Does the tl-next function convey its intention more clearly than the
tl-next-numeric function? If so, why? If not, why not?

In my opinion, tl-next is more readable than tl-next-numeric. We
don't have to associate a number with a color, we just know that the
string "red" means that the light will be red.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 100)
(define BULB_RAD SCALER)
(define BULB_OUTLINE_RAD (* SCALER 1.1))

(define BULB_OUTLINE (circle BULB_OUTLINE_RAD "outline" "black"))

(define SCN_WIDTH (* SCALER 5))
(define SCN_HEIGHT (* SCALER 5))

(define XCENTER (/ SCN_WIDTH 2))
(define YCENTER (/ SCN_HEIGHT 2))

(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Traffic_light is one of:
; - 0
; - 1
; - 2
; Interp.: represents a traffic light state. 0 for stop, 1 for go, and 2
; for slow down

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Traffic_light -> Traffic_light
; Yields the next state, given the current state cs
(check-expect (tl_next 0) 1)
(check-expect (tl_next 1) 2)
(check-expect (tl_next 2) 0)

(define (tl_next cs)(modulo (+ cs 1) 3))

; Traffic_light -> Image
; Renders the current state cs as an Image
(check-expect (tl_render 0)
              (place-image
               (circle BULB_RAD "solid" "red")
               XCENTER YCENTER
               (place-image BULB_OUTLINE XCENTER YCENTER BG)))
(check-expect (tl_render 2)
              (place-image
               (circle BULB_RAD "solid" "yellow")
               XCENTER YCENTER
               (place-image BULB_OUTLINE XCENTER YCENTER BG)))
(check-expect (tl_render 1)
              (place-image
               (circle BULB_RAD "solid" "green")
               XCENTER YCENTER
               (place-image BULB_OUTLINE XCENTER YCENTER BG)))

(define (tl_render cs)
  (place-image
   (circle BULB_RAD "solid"
           (cond [(= cs 0) "red"]
                 [(= cs 1) "green"]
                 [(= cs 2) "yellow"]
                 [else "red"]))
   XCENTER YCENTER
   (place-image BULB_OUTLINE XCENTER YCENTER BG)))

; MAIN /////////////////////////////////////////////////////////////////////////

; Traffic_Light -> Traffic_Light
; simulates a clock-based American traffic light
(define (tl_sim state)
  (big-bang state
    [to-draw tl_render]
    [on-tick tl_next 1]))
