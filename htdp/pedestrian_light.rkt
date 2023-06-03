#|
Author: Mark Beltran
Date: June 3, 2023

Pedestrial light simulation:
- Standby: orange light on red background indefinitely
- Go: triggered by " ", green light, lasts 10 secs
- Countdown: triggered after 10 secs of Go, display
   countdown from 9 to 0 (odd no. orange, even no. green)
- Go back to Standby upon reaching 0 of Countdown
|#

(require 2htdp/image)
(require 2htdp/universe)

; IMAGES ///////////////////////////////////////////////////

(define SCALER 10)
(define SWIDTH (* SCALER 10))
(define SHEIGHT (* SCALER 10))
(define S_XCENTER (/ SWIDTH 2))
(define S_YCENTER (/ SHEIGHT 2))

(define BG_RED (empty-scene SWIDTH SHEIGHT "red"))
(define BG_WYT (empty-scene SWIDTH SHEIGHT))

(define LIGHT_OUTLINE
  (circle (* SCALER 3.3) "solid" "black"))
(define OUTLINE_XCENTER (/ (image-width LIGHT_OUTLINE) 2))
(define OUTLINE_YCENTER (/ (image-height LIGHT_OUTLINE) 2))

(define STOP_BULB
  (place-image
   (circle (* SCALER 3) "solid" "orange")
   OUTLINE_XCENTER OUTLINE_YCENTER LIGHT_OUTLINE))
(define STOP
  (place-image STOP_BULB S_XCENTER S_YCENTER BG_RED))

(define GO_BULB
  (place-image
   (circle (* SCALER 3) "solid" "green")
   OUTLINE_XCENTER OUTLINE_YCENTER LIGHT_OUTLINE))
(define GO
  (place-image GO_BULB S_XCENTER S_YCENTER BG_WYT))
   
; DATA DEFINITIONS /////////////////////////////////////////

; 

; FUNCTION DEFINITIONS /////////////////////////////////////

