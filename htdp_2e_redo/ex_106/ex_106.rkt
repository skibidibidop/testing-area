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
(define CAT_MAX_XPOS (- SCN_WIDTH CAT_RAD))
(define CAT_START_POS CAT_RAD)
(define CAT (circle CAT_RAD "solid" "brown"))

(define CHAM_WIDTH (* SCALER 20))
(define CHAM_HEIGHT (* SCALER 10))
(define CHAM_YPOS (- SCN_HEIGHT
                     (/ CHAM_HEIGHT 2)))
(define CHAM_MAX_XPOS (- SCN_WIDTH
                         (/ CHAM_WIDTH 2)))
(define CHAM_START_POS (/ CHAM_WIDTH 2))
(define CHAM (rectangle CHAM_WIDTH CHAM_HEIGHT "outline" "red"))

(define HAP_WIDTH SCN_WIDTH)
(define HAP_HEIGHT (* SCALER 10))
(define HAP_YPOS (/ HAP_HEIGHT 2))
(define HAP_GAUGE (rectangle HAP_WIDTH HAP_HEIGHT "solid" "red"))
(define HAP_MAX (/ HAP_WIDTH 2))
(define HAP_MIN (- 0 HAP_WIDTH))
(define HAP_UP_PET (/ HAP_WIDTH 5))
(define HAP_UP_FEED (/ HAP_WIDTH 3))

(define MOVSPD (* SCALER 3))
(define SAD_RATE (* SCALER 1))

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

(define CAT_FULL    (make-vcat SCN_XCENTER HAP_MAX))
(define CAT_SAD     (make-vcat SCN_XCENTER HAP_MIN))
(define CAT_BORDER  (make-vcat CAT_MAX_XPOS HAP_MAX))
(define CHAM_FULL   (make-vcham SCN_XCENTER HAP_MAX "red"))
(define CHAM_SAD    (make-vcham SCN_XCENTER HAP_MIN "red"))
(define CHAM_BORDER (make-vcham CHAM_MAX_XPOS HAP_MIN "green"))

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
(check-expect (time_step CAT_FULL)
              (make-vcat (+ SCN_XCENTER MOVSPD) (- HAP_MAX SAD_RATE)))
(check-expect (time_step CHAM_SAD)
              (make-vcham (+ SCN_XCENTER MOVSPD) HAP_MIN "red"))
(check-expect (time_step CAT_BORDER)
              (make-vcat CAT_START_POS (- HAP_MAX SAD_RATE)))
(check-expect (time_step CHAM_BORDER)
              (make-vcham CHAM_START_POS HAP_MIN "green"))

(define (time_step va)
  (cond
    [(vcat? va)
     (make-vcat
      (cond
        [(>= (vcat-loc va) CAT_MAX_XPOS)
         CAT_START_POS]
        [else
         (+ (vcat-loc va) MOVSPD)])
      (cond
        [(<= (vcat-hap va) HAP_MIN)
        HAP_MIN]
        [else
         (- (vcat-hap va) SAD_RATE)]))]
    [(vcham? va)
     (make-vcham
      (cond
        [(>= (vcham-loc va) CHAM_MAX_XPOS)
         CHAM_START_POS]
        [else
         (+ (vcham-loc va) MOVSPD)])
      (cond
        [(<= (vcham-hap va) HAP_MIN)
         HAP_MIN]
        [else
         (- (vcham-hap va) HAP_MIN)])
      (vcham-col va))]))

; VAnimal KeyEvent -> VAnimal
; Changes happiness level or color of VAnimal va depending on KeyEvent ke
(check-expect (control CAT_SAD "up")
              (make-vcat SCN_XCENTER (+ HAP_MIN HAP_UP_PET)))
(check-expect (control CAT_FULL "down") CAT_FULL)
(check-expect (control CHAM_SAD "up") CHAM_SAD)
(check-expect (control CHAM_SAD "down")
              (make-vcham SCN_XCENTER (+ HAP_MIN HAP_UP_FEED) "red"))
(check-expect (control CHAM_FULL "down")
              (make-vcham SCN_XCENTER HAP_MAX "red"))
(check-expect (control CAT_SAD "r") CAT_SAD)
(check-expect (control CHAM_SAD "r") CHAM_SAD)
(check-expect (control CHAM_SAD "g")
              (make-vcham SCN_XCENTER HAP_MIN "green"))

(define (control va ke)
  (cond
    [(vcat? va)
     (make-vcat (vcat-loc va)
                (cond
                  [(and (key=? ke "up")
                        (>= (+ (vcat-hap va) HAP_UP_PET)
                            HAP_MAX))
                   HAP_MAX]
                  [(and (key=? ke "down")
                        (>= (+ (vcat-hap va) HAP_UP_FEED)
                            HAP_MAX))
                   HAP_MAX]
                  [(key=? ke "up")
                   (+ (vcat-hap va) HAP_UP_PET)]
                  [(key=? ke "down")
                   (+ (vcat-hap va) HAP_UP_FEED)]
                  [else (vcat-hap va)]))]
    [(vcham? va)
     (make-vcham (vcham-loc va)
                 (cond
                   [(and (key=? ke "down")
                         (>= (+ (vcham-hap va) HAP_UP_FEED)
                             HAP_MAX))
                    HAP_MAX]
                   [(key=? ke "down")
                    (+ (vcham-hap va) HAP_UP_FEED)]
                   [else (vcham-hap va)])
                 (cond
                   [(key=? ke "r") "red"]
                   [(key=? ke "g") "green"]
                   [(key=? ke "b") "blue"]
                   [else (vcham-col va)]))]))

; MAIN /////////////////////////////////////////////////////////////////////////

(define (main state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]
    [on-key control]))
