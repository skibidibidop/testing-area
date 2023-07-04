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
(define FOOD (circle SCALER "solid" "green"))
(define SEG_WIDTH (image-width WORM_SEGMENT))
(define SEG_HEIGHT (image-height WORM_SEGMENT))
(define BG (empty-scene SWIDTH SHEIGHT))

(define UP_LIMIT SCALER)
(define DOWN_LIMIT (- SHEIGHT SCALER))
(define LEFT_LIMIT SCALER)
(define RIGHT_LIMIT (- SWIDTH SCALER))

(define MOVSPD (* SCALER 2))
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

(define-struct worm_state [worm food])
; (make-worm_state Worm Posn)
; Interp.: (make-worm_state w f), represents the entire worm (w) and where its
; next food (f) is currently located
(make-worm_state (list (make-worm_seg (make-posn 30 40) GO_RIGHT 0)
                       (make-worm_seg (make-posn 20 40) GO_RIGHT 0))
                 (make-posn 50 50))

; A Worm is one of:
; - '()
; (cons Worm_seg Worm)
; Interp.: a list of Worm_segs

; A Food is a Posn
; (make-posn Number Number)
; Interp.: (make-posn 40 50) represents the Food's coordinates

; A Direction is one of:
; - "up"
; - "down"
; - "left"
; - "right"
; Interp.: a key event indicating the next movement direction

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Worm_state -> Image
; Renders all Worm_segs in worm_state-worm and FOOD based on worm_state-food_loc
(check-expect (show_worm_food
               (make-worm_state
                (list (make-worm_seg (make-posn XCENTER YCENTER) GO_RIGHT 0))
                (make-posn 80 40)))
              (place-image WORM_SEGMENT XCENTER YCENTER
               (place-image FOOD 80 40 BG)))
(check-expect (show_worm_food
               (make-worm_state
                (list (make-worm_seg (make-posn XCENTER YCENTER)
                                     GO_RIGHT 0)
                      (make-worm_seg (make-posn (- XCENTER SEG_WIDTH) YCENTER)
                                     GO_RIGHT 0))
                (make-posn 70 70)))
              (place-image
               WORM_SEGMENT XCENTER YCENTER
               (place-image
                WORM_SEGMENT (- XCENTER SEG_WIDTH) YCENTER
                (place-image FOOD 70 70 BG))))

(define (show_worm_food ws)
  (assemble_worm_food (worm_state-worm ws) (worm_state-food ws)))

; Worm Food -> Image
; Handles rendering using a list and Posn from (show_worm_food)
; Tests are under (show_worm_food) function
(define (assemble_worm_food w f)
  (cond
    [(empty? w)
     (place-image FOOD (posn-x f) (posn-y f) BG)]
    [else
     (place-image WORM_SEGMENT
                  (posn-x (worm_seg-loc (first w)))
                  (posn-y (worm_seg-loc (first w)))
                  (assemble_worm_food (rest w) f))]))

; Worm_state -> Worm_state
; Updates Worm_state per tick
(check-expect (time_step
               (make-worm_state
                (list
                 (make-worm_seg (make-posn XCENTER YCENTER) GO_RIGHT 0))
                (make-posn (+ XCENTER 40) (+ YCENTER 40))))
              (make-worm_state
               (list
                (make-worm_seg (make-posn (+ XCENTER GO_RIGHT) YCENTER)
                               GO_RIGHT 0))
               (make-posn (+ XCENTER 40) (+ YCENTER 40))))
(check-expect (time_step
               (make-worm_state
                (list
                 (make-worm_seg
                  (make-posn XCENTER YCENTER) 0 GO_UP)
                 (make-worm_seg
                  (make-posn XCENTER (+ YCENTER SEG_HEIGHT)) 0 GO_UP)
                 (make-worm_seg
                  (make-posn XCENTER (+ YCENTER (* SEG_HEIGHT 2))) 0 GO_UP))
                (make-posn (+ XCENTER 50) (+ YCENTER 50))))
              (make-worm_state
               (list
                (make-worm_seg
                 (make-posn XCENTER (- YCENTER SEG_HEIGHT)) 0 GO_UP)
                (make-worm_seg
                 (make-posn XCENTER YCENTER) 0 GO_UP)
                (make-worm_seg
                 (make-posn XCENTER (+ YCENTER SEG_HEIGHT)) 0 GO_UP))
               (make-posn (+ XCENTER 50) (+ YCENTER 50))))
; Worm is lengthened and Food appears elsewhere on the canvas
(check-random (time_step
               (make-worm_state
                (list
                 (make-worm_seg (make-posn XCENTER YCENTER) GO_RIGHT 0))
                (make-posn XCENTER YCENTER)))
              (make-worm_state
               (list
                (make-worm_seg (make-posn XCENTER YCENTER) GO_RIGHT 0)
                (make-worm_seg (make-posn (- XCENTER SEG_WIDTH) YCENTER)
                               GO_RIGHT 0))
               (food-create (make-posn XCENTER YCENTER))))

(define (time_step ws)
    (if (and (= (posn-x (worm_seg-loc (first (worm_state-worm ws))))
                (posn-x (worm_state-food ws)))
             (= (posn-y (worm_seg-loc (first (worm_state-worm ws))))
                (posn-y (worm_state-food ws))))
        (make-worm_state (grow_worm (worm_state-worm ws))
                         (food-create
                          (worm_seg-loc (first (worm_state-worm ws)))))
        (make-worm_state (move_worm (worm_state-worm ws))
                         (worm_state-food ws))))

; Worm -> Worm
; Adds a Worm_seg to the end of Worm
; Tests under (time_step)
(define (grow_worm worm)
  (cond
    [(empty? worm) '()]
    [else
     (reverse
      (cons
       (make-worm_seg
        (cond
          [(= (worm_seg-hmove (first (reverse worm))) GO_RIGHT)
           (make-posn (- (posn-x (worm_seg-loc (first (reverse worm))))
                         SEG_WIDTH)
                      (posn-y (worm_seg-loc (first (reverse worm)))))]
          [(= (worm_seg-hmove (first (reverse worm))) GO_LEFT)
           (make-posn (+ (posn-x (worm_seg-loc (first (reverse worm))))
                         SEG_WIDTH)
                      (posn-y (worm_seg-loc (first (reverse worm)))))]
          [(= (worm_seg-vmove (first (reverse worm))) GO_UP)
           (make-posn (posn-x (worm_seg-loc (first (reverse worm))))
                      (+ (posn-y (worm_seg-loc (first (reverse worm))))
                         SEG_HEIGHT))]
          [(= (worm_seg-vmove (first (reverse worm))) GO_DOWN)
           (make-posn (posn-x (worm_seg-loc (first (reverse worm))))
                      (- (posn-y (worm_seg-loc (first (reverse worm))))))])
          (worm_seg-hmove (first (reverse worm)))
          (worm_seg-vmove (first (reverse worm))))
       (reverse worm)))]))

; Worm -> Worm
; Simulates Worm movement by adding a Worm_seg to the beginning of Worm
; and removing the last Worm_seg from provided Worm
; Tests under (time_step)
(define (move_worm worm)
  (cond
    [(empty? worm) '()]
    [else
     (reverse
      (rest
       (reverse
        (cons (make-worm_seg
               (make-posn (+ (posn-x (worm_seg-loc (first worm)))
                             (worm_seg-hmove (first worm)))
                          (+ (posn-y (worm_seg-loc (first worm)))
                             (worm_seg-vmove (first worm))))
               (worm_seg-hmove (first worm))
               (worm_seg-vmove (first worm)))
              worm))))]))

; Posn -> Posn
; ???
(check-satisfied (food-create (make-posn 1 1)) not=-1-1?)
(define (food-create p)
  (food-check-create
   p (make-posn (random SWIDTH) (random SHEIGHT))))

; Posn Posn -> Posn
; generative recursion
; ???
(define (food-check-create p candidate)
  (if (equal? p candidate) (food-create p) candidate))

; Posn -> Boolean
; use for testing only
(define (not=-1-1? p)
  (not (and (= (posn-x p) 1) (= (posn-y p) 1))))

; Worm Direction -> Worm
; Changes the Worm's movement direction
(check-expect (change_direction
               (list
                (make-worm_seg
                 (make-posn XCENTER YCENTER) GO_RIGHT 0)) "up")
              (list
               (make-worm_seg
                (make-posn XCENTER YCENTER) 0 GO_UP)))

(define (change_direction worm key_event)
  (cond
    [(empty? worm) '()]
    [else
     (cond
       [(string=? "left" key_event)
        (cons (make-worm_seg
               (make-posn (posn-x (worm_seg-loc (first worm)))
                          (posn-y (worm_seg-loc (first worm))))
               GO_LEFT 0)
              (rest worm))]
       [(string=? "right" key_event)
        (cons (make-worm_seg
               (make-posn (posn-x (worm_seg-loc (first worm)))
                          (posn-y (worm_seg-loc (first worm))))
               GO_RIGHT 0)
              (rest worm))]
       [(string=? "up" key_event)
        (cons (make-worm_seg
               (make-posn (posn-x (worm_seg-loc (first worm)))
                          (posn-y (worm_seg-loc (first worm))))
               0 GO_UP)
              (rest worm))]
       [(string=? "down" key_event)
        (cons (make-worm_seg
               (make-posn (posn-x (worm_seg-loc (first worm)))
                          (posn-y (worm_seg-loc (first worm))))
               0 GO_DOWN)
              (rest worm))]
       [else worm])]))

; Worm -> Boolean
; Has the Worm touched any walls or is its head located in the same
; coordinates as any of its segments
; Tests under (collision?) and (bite_self?)
(define (game_over? worm)
  (cond
    [(empty? worm) #false]
    [else 
     (or (collision? worm)
         (bite_self? worm))]))

; Worm_seg -> Boolean
; Is the Worm's head touching any of the walls
(check-expect (collision?
               (list (make-worm_seg
                      (make-posn XCENTER YCENTER) GO_RIGHT 0)))
              #false)           
(check-expect (collision?
               (list (make-worm_seg
                      (make-posn RIGHT_LIMIT 40) GO_LEFT 0)))
               #true)
(check-expect (collision?
               (list (make-worm_seg
                      (make-posn LEFT_LIMIT 40) GO_RIGHT 0)))
               #true)
(check-expect (collision?
               (list (make-worm_seg (make-posn 40 UP_LIMIT) GO_DOWN 0)))
              #true)
(check-expect (collision?
               (list (make-worm_seg (make-posn 40 DOWN_LIMIT) GO_UP 0)))
              #true)

(define (collision? worm)
  (or (<= (posn-x (worm_seg-loc (first worm))) LEFT_LIMIT)
      (>= (posn-x (worm_seg-loc (first worm))) RIGHT_LIMIT)
      (<= (posn-y (worm_seg-loc (first worm))) UP_LIMIT)
      (>= (posn-y (worm_seg-loc (first worm))) DOWN_LIMIT)))

; Worm -> Boolean
; Is the Worm's head located in the same coordinates as the rest of its body
(check-expect (bite_self?
               (list
                (make-worm_seg (make-posn 100 50) GO_RIGHT 0)
                (make-worm_seg (make-posn 100 40) GO_RIGHT 0)
                (make-worm_seg (make-posn 90 40) GO_RIGHT 0)
                (make-worm_seg (make-posn 90 50) GO_RIGHT 0)
                (make-worm_seg (make-posn 100 50) GO_RIGHT 0)))
              #true)
(check-expect (bite_self?
               (list
                (make-worm_seg (make-posn 100 50) 0 GO_UP)
                (make-worm_seg (make-posn 110 50) 0 GO_UP)
                (make-worm_seg (make-posn 120 50) 0 GO_UP)))
              #false)

(define (bite_self? worm)
  (cond
    [(empty? worm) #false]
    [else
     (member? (worm_seg-loc (first worm))
              (generate_posn_list (rest worm)))]))

; Worm -> Posn_list
; Lists all posns in Worm, aux for (bite_self?)
(define (generate_posn_list worm)
  (cond
    [(empty? worm) '()]
    [else
     (cons (worm_seg-loc (first worm))
           (generate_posn_list (rest worm)))]))

(define WALL_HIT
  (text "Don't touch the walls!" (* SCALER 1.5) "red"))
(define BITE
  (text "Don't bite yourself!" (* SCALER 1.5) "red"))

; Worm_seg -> Image
; Shows game over screen
(define (show_game_over worm)
  (cond
    [(collision? worm)
     (place-image WALL_HIT
                  (+ (/ (image-width WALL_HIT) 2) (/ SCALER 2)) 
                  (- SHEIGHT (/ (image-height WALL_HIT) 2))
                  (show_worm_food worm))]
    [(bite_self? worm)
     (place-image BITE
                  (+ (/ (image-width BITE) 2) (/ SCALER 2))
                  (- SHEIGHT (/ (image-height BITE) 2))
                  (show_worm_food worm))]))

; MAIN /////////////////////////////////////////////////////////////////////////

(define wstate
  (list (make-worm_seg (make-posn XCENTER YCENTER) GO_RIGHT 0)
        (make-worm_seg (make-posn (- XCENTER SEG_WIDTH) YCENTER)
                       GO_RIGHT 0)
        (make-worm_seg (make-posn (- XCENTER (* SEG_WIDTH 2)) YCENTER)
                       GO_RIGHT 0)
        (make-worm_seg (make-posn (- XCENTER (* SEG_WIDTH 3)) YCENTER)
                       GO_RIGHT 0)))

(define (main worm)
  (big-bang worm
    [to-draw show_worm_food]
    [on-tick time_step 0.2]
    [on-key change_direction]
    [stop-when game_over? show_game_over]))

(main wstate)