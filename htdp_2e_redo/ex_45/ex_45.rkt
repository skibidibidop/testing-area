#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 45. Design a “virtual cat” world program that continuously
moves the cat from left to right. Let’s call it cat-prog and let’s assume it
consumes the starting position of the cat. Furthermore, make the cat move
three pixels per clock tick. Whenever the cat disappears on the right, it
reappears on the left. You may wish to read up on the modulo function.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)
(define SCN_WIDTH (* SCALER 50))
(define SCN_HEIGHT (* SCALER 20))
(define XCENTER (/ SCN_WIDTH 2))
(define YCENTER (/ SCN_WIDTH 2))

(define CAT (circle (* SCALER 2) "outline" "black"))
(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

(define CAT_YPOS (- SCN_HEIGHT
                    (/ (image-height CAT) 2)))

(define MOVE_SPEED 3) ; Pixels per tick

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct catpos [x y])
; (make-catpos Number Number)
; Interp.: (make-catpos xpos ypos), represents CAT's
; x (xpos), y (ypos) coordinates

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Catpos -> Image
; Draws CAT on BG with its position based on cpos
(check-expect (render (make-catpos 30 90))
              (place-image CAT 30 90 BG))

(define (render cpos)
  (place-image CAT
               (catpos-x cpos)
               (catpos-y cpos)
               BG))

; Catpos -> Catpos
; Updates the position of CAT per tick
(check-expect (time_step (make-catpos 30 90))
              (make-catpos 33 90))

(define (time_step cpos)
  (make-catpos (+ (catpos-x cpos) MOVE_SPEED)
               (catpos-y cpos)))


; Catpos -> Catpos
(define (main state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]))

(main (make-catpos 0 CAT_YPOS))
