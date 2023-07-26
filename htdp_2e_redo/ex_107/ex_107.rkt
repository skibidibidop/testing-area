;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_107) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 26, 2023

Exercise 107. Design the cham-and-cat program, which deals with
both a virtual cat and a virtual chameleon. You need a data definition for a
“zoo” containing both animals and functions for dealing with it.
The problem statement leaves open how keys manipulate the two ani-
mals. Here are two possible interpretations:

1. Each key event goes to both animals.
2. Each key event applies to only one of the two animals.

For this alternative, you need a data representation that specifies a
focus animal, that is, the animal that can currently be manipulated. To
switch focus, have the key-handling function interpret "k" for “kitty”
and "l" for lizard. Once a player hits "k", the following keystrokes
apply to the cat only—until the player hits "l".

Choose one of the alternatives and design the appropriate program.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 1)

(define SCN_WIDTH (* SCALER 400))
(define SCN_HEIGHT (* SCALER 200))
(define SCN_XCENTER (/ SCN_WIDTH 2))
(define SCN_YCENTER (/ SCN_HEIGHT 2))

(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

(define HGAUGE_WIDTH SCN_WIDTH)
(define HGAUGE_HEIGHT (* SCALER 10))
(define HAP_MAX (/ SCN_WIDTH 2))
(define HAP_MIN (- 0 (/ SCN_WIDTH 2)))

(define MOV_SPD 3)

(define CAT_RAD (* SCALER 25))
(define CAT (circle CAT_RAD "solid" "brown"))
(define CAT_HGAUGE (rectangle HGAUGE_WIDTH HGAUGE_HEIGHT
                              "solid" "brown"))
(define CAT_HGAUGE_YPOS (/ HGAUGE_HEIGHT 2))
(define CAT_YPOS (- SCN_HEIGHT CAT_RAD))
(define CAT_MAX_XPOS (- SCN_WIDTH CAT_RAD))
(define CAT_START_XPOS CAT_RAD)
(define CAT_MOVE MOV_SPD)

(define CHAM_WIDTH (* SCALER 40))
(define CHAM_HEIGHT (* SCALER 15))
(define CHAM_HGAUGE (rectangle HGAUGE_WIDTH HGAUGE_HEIGHT
                               "solid" "green"))
(define CHAM_HGAUGE_YPOS (+ HGAUGE_HEIGHT
                            (/ HGAUGE_HEIGHT 2)))
(define CHAM_YPOS (- SCN_HEIGHT (/ CHAM_HEIGHT 2)))
(define CHAM_MAX_XPOS (/ CHAM_WIDTH 2))
(define CHAM_START_XPOS (- SCN_WIDTH (/ CHAM_WIDTH 2)))
(define CHAM_MOVE (* MOV_SPD -1))

(define SAD_RATE (* SCALER 2))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct zoo [cat cham])
; (make-zoo VCat VCham)
; Interp.: represents the current state, has data for both the cat
; and the chameleon

(define-struct vcat [loc hap])
; (make-vcat Number Number)
; Interp.: (make-vcat l h), represents the cat's x-coordinate (l)
; and happiness level (h)

(define-struct vcham [loc hap col])
; (make-vcham Number Number Color)
; Interp.: (make-vcham l h c), represents the chameleon's
; x-coordinate (l), happiness (h), and color (c)

; A Color is one of:
; "red"
; "green"
; "blue"
; Interp.: a chameleon's color

; A KeyEvent is one of:
; "up"
; "down"
; "r"
; "g"
; "b"
; Interp.:
; "up"   - simulates petting, increases cat's happiness level
; "down" - simulates feeding, increases both animals' happiness level
; "r"    - signals the chameleon to change its color to "red"
; "g"    - signals the chameleon to change its color to "green"
; "b"    - signals the chameleon to change its color to "blue"

(define ZOO_START (make-zoo
                   (make-vcat SCN_XCENTER HAP_MAX)
                   (make-vcham SCN_XCENTER HAP_MAX "red")))
(define ZOO_HUNGRY (make-zoo
                    (make-vcat SCN_XCENTER HAP_MIN)
                    (make-vcham SCN_XCENTER HAP_MIN "green")))
(define CAT_BORDER (make-zoo
                    (make-vcat CAT_MAX_XPOS HAP_MAX)
                    (make-vcham SCN_XCENTER HAP_MAX "blue")))
(define CHAM_BORDER (make-zoo
                     (make-vcat SCN_XCENTER HAP_MAX)
                     (make-vcham CHAM_MAX_XPOS HAP_MAX "red")))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Zoo -> Image
; Renders image based on data from Zoo z
(check-expect (render ZOO_START)
              (place-images
               (list (rectangle CHAM_WIDTH CHAM_HEIGHT
                                "outline" "red")
                     CAT CHAM_HGAUGE CAT_HGAUGE)
               (list (make-posn SCN_XCENTER CHAM_YPOS)
                     (make-posn SCN_XCENTER CAT_YPOS)
                     (make-posn HAP_MAX CHAM_HGAUGE_YPOS)
                     (make-posn HAP_MAX CAT_HGAUGE_YPOS))
               BG))

(define (render z)
  (place-images
   (list (rectangle CHAM_WIDTH CHAM_HEIGHT
                    "outline" (vcham-col (zoo-cham z)))
         CAT CHAM_HGAUGE CAT_HGAUGE)
   (list (make-posn
          (vcham-loc (zoo-cham z)) CHAM_YPOS)
         (make-posn
          (vcat-loc (zoo-cat z)) CAT_YPOS)
         (make-posn
          (vcham-hap (zoo-cham z)) CHAM_HGAUGE_YPOS)
         (make-posn
          (vcat-hap (zoo-cat z)) CAT_HGAUGE_YPOS))
   BG))

; Zoo -> Zoo
; Updates Zoo z per tick
(check-expect (time_step ZOO_START)
              (make-zoo
               (make-vcat (+ SCN_XCENTER CAT_MOVE)
                          (- HAP_MAX SAD_RATE))
               (make-vcham (+ SCN_XCENTER CHAM_MOVE)
                           (- HAP_MAX SAD_RATE)
                           "red")))
(check-expect (time_step CAT_BORDER)
              (make-zoo
               (make-vcat CAT_START_XPOS
                          (- HAP_MAX SAD_RATE))
               (make-vcham (+ SCN_XCENTER CHAM_MOVE)
                           (- HAP_MAX SAD_RATE)
                           "blue")))
(check-expect (time_step CHAM_BORDER)
              (make-zoo
               (make-vcat (+ SCN_XCENTER CAT_MOVE)
                          (- HAP_MAX SAD_RATE))
               (make-vcham CHAM_START_XPOS
                           (- HAP_MAX SAD_RATE)
                           "red")))

(define (time_step z) z)

; Zoo KeyEvent -> Zoo
; Updates Zoo z based on KeyEvent k
(define (control z k) z)

; Zoo -> Boolean
; Does any animal have no happiness left
(define (sad? z) #false)

; MAIN /////////////////////////////////////////////////////////////////////////

(define (cham-and-cat state)
  (big-bang state
    [to-draw render]
    [on-tick time_step]
    [on-key control]
    [stop-when sad?]))