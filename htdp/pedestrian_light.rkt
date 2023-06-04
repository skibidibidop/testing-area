#|
Author: Mark Beltran
Date: June 3, 2023

Pedestrian light simulation:
- Standby: orange light on red background indefinitely
- Go: triggered by " ", green light, lasts 10 secs
- Countdown: triggered after 10 secs of Go, display
   countdown from 9 to 0 (odd no. orange, even no. green)
- Go back to Standby upon reaching 0 of Countdown
|#

(require 2htdp/image)
(require 2htdp/universe)

; CONSTANTS ////////////////////////////////////////////////////////////////////

(define SCALER 10)
(define SWIDTH (* SCALER 10))
(define SHEIGHT (* SCALER 10))
(define S_XCENTER (/ SWIDTH 2))
(define S_YCENTER (/ SHEIGHT 2))

(define OUTLINE (circle (* SCALER 3.3) "solid" "black"))
(define LIGHT_CENTER (make-posn S_XCENTER S_YCENTER))

(define GO_TIMER 10)
(define CDOWN_START 9)
   
; DATA DEFINITIONS /////////////////////////////////////////////////////////////

(define-struct state_standby [light bg])
; state_standby: (make-state_standby String String])
; Interp.: (make-stat_standby light bg) represents a pedestrian traffic light
; with the color of its light (light) and background (bg)
; (define stdby1 (make-state_standby "orange" "red"))
#;
(define (fn_for_state_standby sby)
  (...(state_standby-light sby) (state_standby-bg sby)))

(define-struct state_go [light bg timer])
; state_go: (make-state_go String String Number)
; Interp.: (make-state_go light bg timer) represents a pedestrian traffic light
; with the color of its light (light) and background (bg),
; and its duration (timer)
#;
(define (fn_for_state_go sgo)
  (...(state_go-light sgo) (state_go-bg sgo) (state_go-timer sgo)))

; state_cdown: Natural[-1, 9]
; Interp.: indicates stage of countdown
; (define cdown1 9) ; start of countdown
; (define cdown2 5) ; middle of countdown
; (define cdown3 0) ; end of countdown
; (define cdown4 -1) ; change to state_standby
#;
(define (fn_for_state_cdown cd)
  (...cd))

; - a Signal is one of:
; - state_standby
; - state_go
; - state_cdown
; Interp.:
;  state_standby - orange light, red bg, display until go signal received
;  state_go      - green light, white bg, display for 10s, change to state_cdown
;  state_cdown   - display countdown from 9 to 0, then change to state_standby
; (define s1 (make-state_stanby "orange" "red"))
; (define s2 (make-state_go "green" "white" GO_TIMER)
; (define s3 CDOWN_START)
#;
(define (fn_for_signal sg)
  (cond[(state_standby? sg) (...)]
       [(state_go? sg) (...)]
       [(number? sg) (...)]
       [else ...]))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; String String -> Image
; Modifies light and background color of pedestrian traffic light
(define (colorize lcolor bcolor)
  (place-images
   (list (circle (* SCALER 3) "solid" lcolor)
         OUTLINE)
   (list LIGHT_CENTER LIGHT_CENTER)
   (empty-scene SWIDTH SHEIGHT bcolor)))


; Signal -> Image
; Render pedestrian traffic light based on data from Signal
(check-expect (render (make-state_standby "orange" "red"))
              (place-images
               (list (circle (* SCALER 3) "solid" "orange") OUTLINE)
               (list LIGHT_CENTER LIGHT_CENTER)
               (empty-scene SWIDTH SHEIGHT "red")))
(check-expect (render (make-state_go "green" "white" GO_TIMER))
              (place-images
               (list (circle (* SCALER 3) "solid" "green") OUTLINE)
               (list LIGHT_CENTER LIGHT_CENTER)
               (empty-scene SWIDTH SHEIGHT "white")))
(check-expect (render CDOWN_START)
              (place-image (text (number->string 9) 30 "orange")
                           S_XCENTER S_YCENTER
                           (empty-scene SWIDTH SHEIGHT)))
(check-expect (render 4)
              (place-image (text (number->string 4) 30 "green")
                           S_XCENTER S_YCENTER
                           (empty-scene SWIDTH SHEIGHT)))
(check-expect (render 0)
              (place-image (text (number->string 0) 30 "green")
                           S_XCENTER S_YCENTER
                           (empty-scene SWIDTH SHEIGHT)))
               
(define (render sig)
  (cond[(state_standby? sig)
        (colorize (state_standby-light sig) (state_standby-bg sig))]
       [(state_go? sig)
        (colorize (state_go-light sig) (state_go-bg sig))]
       [(number? sig)
        (place-image (text (number->string sig) 30
                           (cond[(= (modulo sig 2) 0) "green"]
                                [else "orange"]))
                     S_XCENTER S_YCENTER
                     (empty-scene SWIDTH SHEIGHT))]))

; Signal -> Signal
; Updates current Signal per tick
(check-expect (update (make-state_standby "orange" "red"))
              (make-state_standby "orange" "red"))
(check-expect (update (make-state_go "green" "white" GO_TIMER))
              (make-state_go "green" "white" 9))
(check-expect (update (make-state_go "green" "white" 5))
              (make-state_go "green" "white" 4))
(check-expect (update (make-state_go "green" "white" 0))
              CDOWN_START)
(check-expect (update CDOWN_START) 8)
(check-expect (update 4) 3)
(check-expect (update -1)
              (make-state_standby "orange" "red"))

(define (update sig)
  (cond[(state_standby? sig) sig]
       [(and (state_go? sig) (> (state_go-timer sig) 0))
        (make-state_go "green" "white" (sub1 (state_go-timer sig)))]
       [(and (state_go? sig) (= (state_go-timer sig) 0))
        CDOWN_START]
       [(and (number? sig) (>= sig 0))
        (sub1 sig)]
       [(< sig 0)
        (make-state_standby "orange" "red")]))
