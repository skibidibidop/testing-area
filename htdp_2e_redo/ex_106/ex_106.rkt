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

(define SCN_WIDTH  (* SCALER 400))
(define SCN_HEIGHT (* SCALER 250))

(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

(define CAT_RAD (* SCALER 15))
(define CAT (circle CAT_RAD "solid" "brown"))

(define CHAM_WIDTH  (* SCALER 20))
(define CHAM_HEIGHT (* SCALER 10))
(define CHAM (rectangle CHAM_WIDTH CHAM_HEIGHT "outline" "red"))

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

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; VAnimal -> Image
;
(define (render va) BG)

; VAnimal -> VAnimal
;
(define (time_step va) va)

; VAnimal KeyEvent -> VAnimal
;
(define (control va ke) va)

; MAIN /////////////////////////////////////////////////////////////////////////

(define (main state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]
    [on-key control]))
