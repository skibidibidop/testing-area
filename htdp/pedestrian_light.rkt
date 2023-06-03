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

(define state_cdown CDOWN_START)

; - a Signal is one of:
; - state_standby
; - state_go
; - state_cdown
; Interp.:
;  state_standby - orange light, red bg, display until go signal received
;  state_go      - green light, white bg, display for 10s, change to state_cdown
;  state_cdown   - display countdown from 9 to 0, odd orange, even green,
;                - then change to state_standby
; (define s1 (make-state_stanby "orange" "red"))
; (define s2 (make-state_go "green" "white" CDOWN_START))
; (define s3 state_cdown)
#;
(define (fn_for_signal sg)
  (cond[(state_standby? sg) (...)]
       [(state_go? sg) (...)]
       [(number? sg) (...)]
       [else ...]))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; signal -> Image
; Modifies light and background color depending on data from Signal
(check-expect (emit_light ...) ...)
