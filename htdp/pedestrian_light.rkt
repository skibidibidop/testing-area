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

; state_cdown: Natural[0, 10)
; Interp.: indicates stage of countdown
; (define cdown1 9) ; start of countdown
; (define cdown2 5) ; middle of countdown
; (define cdown3 0) ; end of countdown
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
; (define s2 (make-state_go "green" "white" CDOWN_START))
; (define s3 CDOWN_START)
#;
(define (fn_for_signal sg)
  (cond[(state_standby? sg) (...)]
       [(state_go? sg) (...)]
       [(number? sg) (...)]
       [else ...]))

(define wait_sig (make-state_standby "orange" "red"))
(define go_sig (make-state_go "green" "white" CDOWN_START))
(define cdown_sig CDOWN_START)

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; Signal -> Image
; Modifies light and background color depending on data from Signal
(check-expect (emit_light ...) ...)
