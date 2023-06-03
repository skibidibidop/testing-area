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

; IMAGES ///////////////////////////////////////////////////////////////////////

(define SCALER 10)
(define SWIDTH (* SCALER 10))
(define SHEIGHT (* SCALER 10))
(define S_XCENTER (/ SWIDTH 2))
(define S_YCENTER (/ SHEIGHT 2))
   
; DATA DEFINITIONS /////////////////////////////////////////////////////////////

(define-struct state_standby [light bg])
; state_standby: (make-state_standby String String])
; Interp.: (make-standby light bg) represents a pedestrian traffic light with
; the color of its light (light) and background (bg)
; (define stdby1 (make-state_standby "orange" "red"))
#;
(define (fn_for_state_standby sby)
  (...(state_standby-light sby) (state_standby-bg sby)))

; - a Signal is one of:
; - state_standby
; - state_go
; - state_cdown
; Interpretation:
; state_standby : 
(define s1 (make-state_standby
            (
#;
(define fn_for_signal)

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////

; signal -> Image
; Modifies light and background color depending on data from Signal
(check-expect (emit_light ...) ...)
