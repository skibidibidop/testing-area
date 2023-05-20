#|
Author: Mark Beltran
Date: May 20, 2023

Simulation of a rudimentary traffic light system.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define scaler 40)

; Images
(define red_light
  (circle (* scaler 1) "solid" "red"))
(define green_light
  (circle (* scaler 1) "solid" "green"))
(define yellow_light
  (circle (* scaler 1) "solid" "yellow"))
(define background
  (square (* scaler 1.1) "outline" "white"))

; Centers
(define center_x
  (/ (image-width background) 2))
(define center_y
  (/ (image-height background) 2))

; A TrafficLight is one of the following Numbers:
; 0 for red light
; 1 for green light
; 2 for yellow light
; Interpretation: the numbers above represent the
; three states a traffic light can assume

(define RED 0)
(define GREEN 1)
(define YELLOW 2)

; TrafficLight -> Image
; Render appropriate image based on current state
(check-expect (give_img RED)
              (place-image red_light
                           center_x center_y
                           background))
(check-expect (give_img GREEN)
              (place-image green_light
                           center_x center_y
                           background))
(check-expect (give_img YELLOW)
              (place-image yellow_light
                           center_x center_y
                           background))
(define (give_img cw)
  (cond[(= cw RED) (place-image red_light
                                center_x center_y
                                background)]
       [(= cw GREEN) (place-image green_light
                                  center_x center_y
                                  background)]
       [(= cw YELLOW) (place-image yellow_light
                                   center_x center_y
                                   background)]))

; TrafficLight -> TrafficLight
; Give the next state based on current state
(check-expect (give_next RED) GREEN)
(check-expect (give_next GREEN) YELLOW)
(check-expect (give_next YELLOW) RED)
(define (give_next cw)
  (cond[(= cw RED) GREEN]
       [(= cw GREEN) YELLOW]
       [(= cw YELLOW) RED]))

; Main
(big-bang RED
  [to-draw give_img]
  [on-tick give_next])
