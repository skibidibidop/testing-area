#|
Author: Mark Beltran
Date: July 26, 2023

Exercise 106. In chapter 5.11 we discussed the creation of virtual pets
that come with happiness gauges. One of the virtual pets is a cat; the other
one, a chameleon. Each program is dedicated to a single pet, however.
Design the cat-cham world program. Given both a location and an animal,
it walks the latter across the canvas, starting from the given location.

Here is the chosen data representation for animals:

; A VAnimal is either
; -- a VCat
; -- a VCham

where VCat and VCham are your data definitions from exercises 88 and 92.

Given that VAnimal is the collection of world states, you need to design

• a rendering function from VAnimal to Image;
• a function for handling clock ticks, from VAnimal to VAnimal; and
• a function for dealing with key events so that you can feed and pet
and colorize your animal—as applicable.

It remains impossible to change the color of a cat or to pet a chameleon.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 1)

(define SCN_WIDTH (* SCALER 400))
(define SCN_HEIGHT (* SCALER 250))
(define SCN_XCENTER (/ SCN_WIDTH 2))

(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

(define CAT_RAD (* SCALER 15))
(define CAT_YPOS (- SCN_HEIGHT CAT_RAD))
(define CAT (circle CAT_RAD "solid" "brown"))

(define CHAM_WIDTH (* SCALER 20))
(define CHAM_HEIGHT (* SCALER 10))
(define CHAM_YPOS (- SCN_HEIGHT
                     (/ CHAM_HEIGHT 2)))
(define CHAM (rectangle CHAM_WIDTH CHAM_HEIGHT "outline" "red"))

(define HAP_WIDTH SCN_WIDTH)
(define HAP_HEIGHT (* SCALER 10))
(define HAP_YPOS (/ HAP_HEIGHT 2))
(define HAP_GAUGE (rectangle HAP_WIDTH HAP_HEIGHT "solid" "red"))
(define HAP_MAX (/ HAP_WIDTH 2))
(define HAP_MIN (- 0 HAP_WIDTH))

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A VAnimal is one of:
; A VCat
; A VCham

(define-struct vcat [loc hap])
; (make-vcat Number Number)
; Interp.: (make-vcat l h) represents the cat's x-coordinate (l) and
; happiness level (h)

(define-struct vcham [loc hap col])
; (make-vcham Number Number Color)
; Interp.: (make-vcham l h c) represents the chameleon's
; x-coordinate (l), happiness level (h), and color (c)

; A Color is one of:
; "red"
; "green"
; "blue"
; Interp.: represents a chameleon's color

; A KeyEvent is one of:
; "up"
; "down"
; "r"
; "g"
; "b"
; Interp.: represents a way to interact with a VAnimal. "up" simulates
; petting the cat, and "down" simulates feeding the cat or chameleon.
; "r", "g", and "b" changes the chameleon's color to red, green, or blue,
; respectively.

(define CAT_FULL  (make-vcat SCN_XCENTER HAP_MAX))
(define CAT_SAD   (make-vcat SCN_XCENTER HAP_MIN))
(define CHAM_FULL (make-vcham SCN_XCENTER HAP_MAX "red"))
(define CHAM_SAD  (make-vcham SCN_XCENTER HAP_MIN "red"))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; VAnimal -> Image
; Renders image based on data from VAnimal va
(check-expect (render CAT_FULL)
              (place-images
               (list CAT HAP_GAUGE)
               (list (make-posn SCN_XCENTER CAT_YPOS)
                     (make-posn HAP_MAX HAP_YPOS))
               BG))
(check-expect (render CAT_SAD)
              (place-images
               (list CAT HAP_GAUGE)
               (list (make-posn SCN_XCENTER CAT_YPOS)
                     (make-posn HAP_MIN HAP_YPOS))
               BG))
(check-expect (render CHAM_FULL)
              (place-images
               (list CHAM HAP_GAUGE)
               (list (make-posn SCN_XCENTER CHAM_YPOS)
                     (make-posn HAP_MAX HAP_YPOS))
               BG))
(check-expect (render CHAM_SAD)
              (place-images
               (list CHAM HAP_GAUGE)
               (list (make-posn SCN_XCENTER CHAM_YPOS)
                     (make-posn HAP_MIN HAP_YPOS))
               BG))

(define (render va)
  (cond
    [(vcat? va)
     (place-images
      (list CAT HAP_GAUGE)
      (list (make-posn (vcat-loc va) CAT_YPOS)
            (make-posn (vcat-hap va) HAP_YPOS))
      BG)]
    [(vcham? va)
     (place-images
      (list CHAM HAP_GAUGE)
      (list (make-posn (vcham-loc va) CHAM_YPOS)
            (make-posn (vcham-hap va) HAP_YPOS))
      BG)]))

; VAnimal -> VAnimal
; Updates VAnimal va per tick
(define (time_step va) va)

; VAnimal KeyEvent -> VAnimal
; Changes happiness level or color of VAnimal va depending on KeyEvent ke
(define (control va ke) va)

; MAIN /////////////////////////////////////////////////////////////////////////

(define (main state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]
    [on-key control]))
