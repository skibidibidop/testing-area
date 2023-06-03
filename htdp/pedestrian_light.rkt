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

(define LIGHT_OUTLINE
  (circle (* SCALER 3.3) "solid" "black"))
(define OUTLINE_XCENTER (/ (image-width LIGHT_OUTLINE) 2))
(define OUTLINE_YCENTER (/ (image-height LIGHT_OUTLINE) 2))
   
; DATA DEFINITIONS /////////////////////////////////////////

; cdown is one of:
; -- #false
; -- Natural [0, 10)
; (define CD1 #false) ; countdown not yet started
; (define CD2 0) ; end of countdown
; (define CD3 5) ; middle of countdown
; (define CD4 9) ; start of countdown
#; 
(define (fn_for_cdown cd)
  (cond
    [(boolean? cdown) (...)]
    [(and (number? cd) (cd <= 9) (cd >= 0)) (...)]
    [else (...)]))

(define-struct pcross [lcolor bg cdown])
; pcross: (make-pcross String String cdown)
; (Interp.: (make-pcross lcolor bg cd) is a pedestrian
;  crossing light with light color (lcolor), background
;  color (bg), and countdown number (cdown)

; FUNCTION DEFINITIONS /////////////////////////////////////

