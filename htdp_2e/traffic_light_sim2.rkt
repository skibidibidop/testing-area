;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname traffic_light_sim2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 21, 2023

Studying FSM/FSA by simulating traffic lights.
|#

(require 2htdp/universe)
(require 2htdp/image)

; A TrafficLight is one of the following:
; -- 0: red
; -- 1: yellow
; -- 2: green
; Interpretation: traffic light colors
; represented as 0, 1, or 2

(define RED 0)
(define YELLOW 1)
(define GREEN 2)

(define scaler 10)
(define SCENE_WIDTH (* scaler 5))
(define SCENE_HEIGHT (* scaler 7))
(define SCENE_X_CENTER (/ SCENE_WIDTH 2))
(define SCENE_Y_CENTER (/ SCENE_HEIGHT 2))

(define bulb_radius 2)
(define bg (empty-scene SCENE_WIDTH SCENE_HEIGHT))

; TrafficLight -> TrafficLight
; Yields the next state based on
; the current state (cs)
(define (tl_next cs)
  (cond[(= cs RED) YELLOW]
       [(= cs YELLOW) GREEN]
       [(= cs GREEN) RED]))

; TrafficLight -> Image
; Signals the traffic light color to tl_render
(check-expect (color_decider RED) "red")
(check-expect (color_decider YELLOW) "yellow")
(check-expect (color_decider GREEN) "green")
(define (color_decider current_state)
  (cond[(= current_state RED) "red"]
       [(= current_state YELLOW) "yellow"]
       [(= current_state GREEN) "green"]))

; TrafficLight -> Image
; Renders current state as an image
(check-expect (tl_render RED)
              (place-image
               (circle (* scaler bulb_radius) "solid" "red")
               SCENE_X_CENTER SCENE_Y_CENTER
               bg))
(check-expect (tl_render YELLOW)
              (place-image
               (circle (* scaler bulb_radius) "solid" "yellow")
               SCENE_X_CENTER SCENE_Y_CENTER
               bg))
(check-expect (tl_render GREEN)
              (place-image
               (circle (* scaler bulb_radius) "solid" "green")
               SCENE_X_CENTER SCENE_Y_CENTER
               bg))
(define (tl_render current_state)
  (place-image
   (circle (* scaler bulb_radius) "solid"
           (color_decider current_state))
   SCENE_X_CENTER SCENE_Y_CENTER
   bg))

; TrafficLight -> TrafficLight
; Simulates a clock-based traffic light
(define (tl_sim init_state)
  (big-bang init_state
    [to-draw tl_render]
    [on-tick tl_next 0.5]))

(tl_sim YELLOW)