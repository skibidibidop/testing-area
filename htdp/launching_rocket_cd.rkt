#|
Author: Mark Beltran
Date: May 20, 2023

Solve along with sample problem for launching
rocket countdown.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCENE_HEIGHT 300)
(define SCENE_WIDTH 100)
(define YDELTA 3)
(define XFIXED 10)

(define BG (empty-scene SCENE_WIDTH SCENE_HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))

(define ROCKET_CENTER
  (/ (image-height ROCKET) 2))
(define STARTING_POS (- SCENE_HEIGHT ROCKET_CENTER))

; An LRCD (short for launching rocket countdown)
; is one of:
; -- "resting"
; -- a Number between -3 and -1
; -- a Nonnegative Number
; Interpretation: a grounded rocket, in countdown mode,
; the distance (# of pixels) between the top of the
; canvas and the rocket

; LRCD -> Image
; Render image based on value given by (show cw)
(check-expect (put_rocket 30)
              (place-image ROCKET XFIXED 30 BG))
(define (put_rocket y_coord)
  (place-image ROCKET XFIXED y_coord BG))

; LRCD -> Image
; Checks current world state and gives appropriate value
; to (put_rocket y_coord)
(check-expect (show "resting") (put_rocket STARTING_POS))
(check-expect (show -2)
              (place-image (text "-2" 20 "red")
                           XFIXED (* 3/4 SCENE_WIDTH)
                           (put_rocket STARTING_POS)))
(check-expect (show 50) (put_rocket (- SCENE_HEIGHT
                                       (+ 50 ROCKET_CENTER))))
(define (show cw)
  (cond[(string? cw) (put_rocket STARTING_POS)]
       [(<= -3 cw -1) (place-image (text (number->string cw) 20 "red")
                                   XFIXED (* 3/4 SCENE_WIDTH)
                                   (put_rocket STARTING_POS))]
       [(>= cw 0) (put_rocket (- SCENE_HEIGHT
                                 (+ cw ROCKET_CENTER)))]))

; LRCD KeyEvent -> LRCD
; if rocket is still resting, begin countdown
(define (launch x ke) ...)

; LRCD -> LRCD
; raise the rocket by YDELTA after countdown
; or if already moving
(define (fly x) ...)
