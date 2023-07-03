;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname worm) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 29, 2023

Snake game, basically.
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)
(define SWIDTH (* SCALER 50))
(define SHEIGHT (* SCALER 50))
(define XCENTER (/ SWIDTH 2))
(define YCENTER (/ SHEIGHT 2))

(define WORM_SEGMENT (circle SCALER "solid" "red"))
(define SEG_WIDTH (image-width WORM_SEGMENT))
(define SEG_HEIGHT (image-height WORM_SEGMENT))
(define BG (empty-scene SWIDTH SHEIGHT))

(define UP_LIMIT
  (/ SCALER 2))
(define DOWN_LIMIT
  (- SHEIGHT
     (/ SCALER 2)))
(define LEFT_LIMIT
  (/ SCALER 2))
(define RIGHT_LIMIT
  (- SWIDTH
     (/ SCALER 2)))

(define MOVSPD SCALER)
(define GO_UP (* MOVSPD -1))
(define GO_DOWN MOVSPD)
(define GO_RIGHT MOVSPD)
(define GO_LEFT (* MOVSPD -1))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct worm_seg [loc hmove vmove])
; (make-worm_seg Posn Number Number)
; Interp.: (make-worm_seg l h v), represents a segment of a worm, with its
; coordinates (l), horizontal velocity (h), and vertical velocity (v)
(make-worm_seg (make-posn 30 40) 4 0)

; A Worm is one of:
; - '()
; (cons Worm_seg Worm)
; Interp.: a list of Worm_segs

; A Direction is one of:
; - "up"
; - "down"
; - "left"
; - "right"
; Interp.: a key event indicating the next movement direction

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Worm -> Image
; Draws all Worm_segs in Worm as WORM_SEGMENTS
(check-expect (render '()) BG)
(check-expect (render
               (list (make-worm_seg (make-posn XCENTER YCENTER)
                                    GO_RIGHT 0)))
              (place-image WORM_SEGMENT XCENTER YCENTER BG))
(check-expect (render
               (list (make-worm_seg (make-posn XCENTER YCENTER)
                                    GO_RIGHT 0)
                     (make-worm_seg (make-posn (- XCENTER SEG_WIDTH) YCENTER)
                                    GO_RIGHT 0)))
              (place-image
               WORM_SEGMENT XCENTER YCENTER
               (place-image
                WORM_SEGMENT (- XCENTER SEG_WIDTH) YCENTER
                BG)))

(define (render worm)
  (cond
    [(empty? worm) BG]
    [else
     (place-image WORM_SEGMENT
                  (posn-x (worm_seg-loc (first worm)))
                  (posn-y (worm_seg-loc (first worm)))
                  (render (rest worm)))]))

; Worm -> Worm
; Updates all Worm_segs in Worm per tick
(check-expect (time_step '()) '())
(check-expect (time_step
               (list (make-worm_seg (make-posn XCENTER YCENTER)
                                    GO_RIGHT 0)))
              (list (make-worm_seg
                     (make-posn (+ XCENTER GO_RIGHT) YCENTER)
                     GO_RIGHT 0)))
(check-expect (time_step
               (list (make-worm_seg (make-posn XCENTER YCENTER) GO_RIGHT 0)
                     (make-worm_seg (make-posn (- XCENTER SEG_WIDTH) YCENTER)
                                    GO_RIGHT 0)))
              (list (make-worm_seg
                     (make-posn (+ XCENTER GO_RIGHT) YCENTER) GO_RIGHT 0)
                    (make-worm_seg
                     (make-posn XCENTER YCENTER) GO_RIGHT 0)))

(define (time_step worm)
  (cond
    [(empty? worm) '()]
    [else
     (cons (make-worm_seg
            (make-posn (+ (posn-x (worm_seg-loc (first worm)))
                          (worm_seg-hmove (first worm)))
                       (+ (posn-y (worm_seg-loc (first worm)))
                          (worm_seg-vmove (first worm))))
            (worm_seg-hmove (first worm))
            (worm_seg-vmove (first worm)))
           (time_step (rest worm)))]))

; Worm Direction -> Worm
; Changes the Worm's movement direction
(check-expect (change_direction
               (make-worm_seg (make-posn 50 50) GO_RIGHT 0) "right")
              (make-worm_seg (make-posn 50 50) GO_RIGHT 0))
(check-expect (change_direction
               (make-worm_seg (make-posn 50 50) GO_RIGHT 0) "left")
              (make-worm_seg (make-posn 50 50) GO_LEFT 0))
(check-expect (change_direction
               (make-worm_seg (make-posn 50 50) GO_RIGHT 0) "up")
              (make-worm_seg (make-posn 50 50) 0 GO_UP))
(check-expect (change_direction
               (make-worm_seg (make-posn 50 50) GO_RIGHT 0) "down")
              (make-worm_seg (make-posn 50 50) 0 GO_DOWN))

(define (change_direction wseg key_event)
  (cond
    [(string=? "left" key_event)
     (make-worm_seg
      (make-posn (posn-x (worm_seg-loc wseg)) (posn-y (worm_seg-loc wseg)))
      GO_LEFT 0)]
    [(string=? "right" key_event)
     (make-worm_seg
      (make-posn (posn-x (worm_seg-loc wseg)) (posn-y (worm_seg-loc wseg)))
      GO_RIGHT 0)]
    [(string=? "up" key_event)
     (make-worm_seg
      (make-posn (posn-x (worm_seg-loc wseg)) (posn-y (worm_seg-loc wseg)))
      0 GO_UP)]
    [(string=? "down" key_event)
     (make-worm_seg
      (make-posn (posn-x (worm_seg-loc wseg)) (posn-y (worm_seg-loc wseg)))
      0 GO_DOWN)]
    [else wseg]))

; Worm_seg -> Boolean
; Displays game over message when the worm reaches any of the walls
(check-expect (walls_reached?
               (make-worm_seg (make-posn XCENTER YCENTER) GO_LEFT 0))
              #false)
(check-expect (walls_reached?
               (make-worm_seg (make-posn RIGHT_LIMIT 40) GO_LEFT 0))
              #true)
(check-expect (walls_reached?
               (make-worm_seg (make-posn LEFT_LIMIT 40) GO_RIGHT 0))
              #true)
(check-expect (walls_reached?
               (make-worm_seg (make-posn 40 UP_LIMIT) GO_DOWN 0))
              #true)
(check-expect (walls_reached?
               (make-worm_seg (make-posn 40 DOWN_LIMIT) GO_UP 0))
              #true)

(define (walls_reached? worm)
  (or (<= (posn-x (worm_seg-loc (first worm))) LEFT_LIMIT)
      (>= (posn-x (worm_seg-loc (first worm))) RIGHT_LIMIT)
      (<= (posn-y (worm_seg-loc (first worm))) UP_LIMIT)
      (>= (posn-y (worm_seg-loc (first worm))) DOWN_LIMIT)))

(define GAME_OVER
   (text "Don't touch the walls!" (* SCALER 1.5) "red"))

; Worm_seg -> Image
; Shows game over screen
(define (show_game_over wseg)
  (place-image GAME_OVER
               (+ (/ (image-width GAME_OVER) 2) (/ SCALER 2)) 
               (- SHEIGHT (/ (image-height GAME_OVER) 2))
               (render wseg)))

; Worm -> Worm
; Adds a Worm_seg to Worm if Food is consumed by it
(define (grow_worm wseg) '())

; MAIN /////////////////////////////////////////////////////////////////////////

(define worm_state
  (list (make-worm_seg (make-posn XCENTER YCENTER) GO_RIGHT 0)
        (make-worm_seg (make-posn (- XCENTER SEG_WIDTH) YCENTER)
                       GO_RIGHT 0)))

(define (main worm)
  (big-bang worm
    [to-draw render]
    [on-tick time_step 0.1]
    [on-key change_direction]
    [stop-when walls_reached? show_game_over]))

(main worm_state)