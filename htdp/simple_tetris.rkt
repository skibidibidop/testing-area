#|
Author: Mark Beltran
Date: July 5, 2023

Project: Simple Tetris

Outline:
- Constants
- Data definition
- (tetris_render)
--- (draw_blocks)
- (time_step)
--- (collision_bottom?)
- (alter_movement)
--- (collision_left?)
--- (collision_right?)
- (tetris_main)
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 100)

(define SCENE_WIDTH (* SCALER 10))
(define SCENE_HEIGHT (* SCALER 10))
(define XCENTER (/ SCENE_WIDTH 2))
(define YCENTER (/ SCENE_HEIGHT 2))

(define BLOCK_SIZE SCALER)
(define HALF_BLOCK_SIZE (/ BLOCK_SIZE 2))

(define BLOCK
  (overlay (square (- BLOCK_SIZE 1) "solid" "red")
           (square BLOCK_SIZE "outline" "black")))
(define BG (empty-scene SCENE_WIDTH SCENE_HEIGHT))

(define FALL_SLOW (* SCALER 0.1))
(define FALL_FAST (* SCALER 0.2))
(define GO_LEFT (* BLOCK_SIZE -1))
(define GO_RIGHT BLOCK_SIZE)

(define FIRST_FROM_BORDER HALF_BLOCK_SIZE)
(define SECOND_FROM_BORDER (* HALF_BLOCK_SIZE 3))
(define THIRD_FROM_BORDER (* HALF_BLOCK_SIZE 5))
(define FOURTH_FROM_BORDER (* HALF_BLOCK_SIZE 7))
(define FIFTH_FROM_BORDER (* HALF_BLOCK_SIZE 9))
(define SIXTH_FROM_BORDER (* HALF_BLOCK_SIZE 11))
(define SEVENTH_FROM_BORDER (* HALF_BLOCK_SIZE 13))
(define EIGHTH_FROM_BORDER (* HALF_BLOCK_SIZE 15))
(define NINTH_FROM_BORDER (* HALF_BLOCK_SIZE 17))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct tetris [block landscape speed])
; (make-tetris Block Landscape)
; Interp.: (make-tetris b0 (list b1 b2 ...) FALL_SLOW) represents the
; falling block (b0), resting blocks (list b1 b2 ...), and the falling block's
; fall speed (FALL_SLOW) in pixels/tick

; A Landscape is one of:
; - '()
; - (cons Block Landscape)

; A Block is a Posn
; Interp.: (make-posn x y) represents coordinates of the Block's center point

; A Direction is one of:
; - "left"
; - "right"
; - "up"
; - "down"
; Interp.: represents key events (left/right/down arrow pressed)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

(define first_block_spawn
  (make-tetris (make-posn XCENTER FIRST_FROM_BORDER)
               '() FALL_SLOW))
(define first_block_dropping
  (make-tetris (make-posn XCENTER YCENTER)
               '() FALL_SLOW))
(define first_block_landed
  (make-tetris (make-posn XCENTER (- SCENE_HEIGHT HALF_BLOCK_SIZE))
               '() FALL_SLOW))
(define next_block_spawn
  (make-tetris (make-posn XCENTER FIRST_FROM_BORDER)
               (list (make-posn XCENTER
                                (- SCENE_HEIGHT FIRST_FROM_BORDER)))
               FALL_SLOW))
(define block_on_block
  (make-tetris (make-posn XCENTER (- SCENE_HEIGHT SECOND_FROM_BORDER))
               (list (make-posn XCENTER
                                (- SCENE_HEIGHT FIRST_FROM_BORDER)))
               FALL_SLOW))
; Blocks are added to the beginning of the list to avoid having to
; reverse the list
(define full_stack
  (make-tetris (make-posn XCENTER HALF_BLOCK_SIZE)
               (list (make-posn XCENTER (- SCENE_HEIGHT NINTH_FROM_BORDER))
                     (make-posn XCENTER (- SCENE_HEIGHT EIGHTH_FROM_BORDER))
                     (make-posn XCENTER (- SCENE_HEIGHT SEVENTH_FROM_BORDER))
                     (make-posn XCENTER (- SCENE_HEIGHT SIXTH_FROM_BORDER))
                     (make-posn XCENTER (- SCENE_HEIGHT FIFTH_FROM_BORDER))
                     (make-posn XCENTER (- SCENE_HEIGHT FOURTH_FROM_BORDER))
                     (make-posn XCENTER (- SCENE_HEIGHT THIRD_FROM_BORDER))
                     (make-posn XCENTER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                     (make-posn XCENTER (- SCENE_HEIGHT FIRST_FROM_BORDER)))
               FALL_SLOW))
                                        
(define full_row
  (make-tetris (make-posn FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
               (list (make-posn (- SCENE_WIDTH NINTH_FROM_BORDER)
                                (- SCENE_HEIGHT FIRST_FROM_BORDER))
                     (make-posn (- SCENE_WIDTH EIGHTH_FROM_BORDER)
                                (- SCENE_HEIGHT FIRST_FROM_BORDER))
                     (make-posn (- SCENE_WIDTH SEVENTH_FROM_BORDER)
                                (- SCENE_HEIGHT FIRST_FROM_BORDER))
                     (make-posn (- SCENE_WIDTH SIXTH_FROM_BORDER)
                                (- SCENE_HEIGHT FIRST_FROM_BORDER))
                     (make-posn (- SCENE_WIDTH FIFTH_FROM_BORDER)
                                (- SCENE_HEIGHT FIRST_FROM_BORDER))
                     (make-posn (- SCENE_WIDTH FOURTH_FROM_BORDER)
                                (- SCENE_HEIGHT FIRST_FROM_BORDER))
                     (make-posn (- SCENE_WIDTH THIRD_FROM_BORDER)
                                (- SCENE_HEIGHT FIRST_FROM_BORDER))
                     (make-posn (- SCENE_WIDTH SECOND_FROM_BORDER)
                                (- SCENE_HEIGHT FIRST_FROM_BORDER))
                     (make-posn (- SCENE_WIDTH FIRST_FROM_BORDER)
                                (- SCENE_HEIGHT FIRST_FROM_BORDER)))
               FALL_SLOW))
(define max_left
  (make-tetris (make-posn FIRST_FROM_BORDER YCENTER) '() FALL_SLOW))
(define max_right
  (make-tetris (make-posn (- SCENE_WIDTH FIRST_FROM_BORDER) YCENTER)
               '() FALL_SLOW))

; Tetris -> Image
; Turns tetris instance to an image
(check-expect (tetris_render first_block_spawn)
              (place-image BLOCK XCENTER FIRST_FROM_BORDER
                           BG))
(check-expect (tetris_render first_block_dropping)
              (place-image BLOCK XCENTER YCENTER
                           BG))
(check-expect (tetris_render first_block_landed)
              (place-image BLOCK XCENTER (- SCENE_HEIGHT FIRST_FROM_BORDER)
                           BG))
(check-expect (tetris_render next_block_spawn)
              (place-image
               BLOCK XCENTER (- SCENE_HEIGHT FIRST_FROM_BORDER)
               (place-image
                BLOCK XCENTER FIRST_FROM_BORDER
                BG)))
(check-expect (tetris_render block_on_block)
              (place-image
               BLOCK XCENTER (- SCENE_HEIGHT FIRST_FROM_BORDER)
               (place-image
                BLOCK XCENTER (- SCENE_HEIGHT SECOND_FROM_BORDER)
                BG)))
(check-expect (tetris_render full_stack)
              (place-image
               BLOCK XCENTER (- SCENE_HEIGHT NINTH_FROM_BORDER)
               (place-image
                BLOCK XCENTER (- SCENE_HEIGHT EIGHTH_FROM_BORDER)
                (place-image
                 BLOCK XCENTER (- SCENE_HEIGHT SEVENTH_FROM_BORDER)
                 (place-image
                  BLOCK XCENTER (- SCENE_HEIGHT SIXTH_FROM_BORDER)
                  (place-image
                   BLOCK XCENTER (- SCENE_HEIGHT FIFTH_FROM_BORDER)
                   (place-image
                    BLOCK XCENTER (- SCENE_HEIGHT FOURTH_FROM_BORDER)
                    (place-image
                     BLOCK XCENTER (- SCENE_HEIGHT THIRD_FROM_BORDER)
                     (place-image
                      BLOCK XCENTER (- SCENE_HEIGHT SECOND_FROM_BORDER)
                      (place-image
                       BLOCK XCENTER (- SCENE_HEIGHT FIRST_FROM_BORDER)
                       (place-image
                        BLOCK XCENTER FIRST_FROM_BORDER BG)))))))))))
(check-expect (tetris_render full_row)
              (place-image
               BLOCK (- SCENE_WIDTH NINTH_FROM_BORDER)
               (- SCENE_HEIGHT FIRST_FROM_BORDER)
               (place-image BLOCK
                            (- SCENE_WIDTH EIGHTH_FROM_BORDER)
                            (- SCENE_HEIGHT FIRST_FROM_BORDER)
                (place-image BLOCK
                             (- SCENE_WIDTH SEVENTH_FROM_BORDER)
                             (- SCENE_HEIGHT FIRST_FROM_BORDER)
                 (place-image BLOCK
                              (- SCENE_WIDTH SIXTH_FROM_BORDER)
                              (- SCENE_HEIGHT FIRST_FROM_BORDER)
                  (place-image BLOCK
                               (- SCENE_WIDTH FIFTH_FROM_BORDER)
                               (- SCENE_HEIGHT FIRST_FROM_BORDER)
                   (place-image BLOCK
                                (- SCENE_WIDTH FOURTH_FROM_BORDER)
                                (- SCENE_HEIGHT FIRST_FROM_BORDER)
                    (place-image BLOCK
                                 (- SCENE_WIDTH THIRD_FROM_BORDER)
                                 (- SCENE_HEIGHT FIRST_FROM_BORDER)
                     (place-image BLOCK
                                  (- SCENE_WIDTH SECOND_FROM_BORDER)
                                  (- SCENE_HEIGHT FIRST_FROM_BORDER)
                      (place-image BLOCK
                                   (- SCENE_WIDTH FIRST_FROM_BORDER)
                                   (- SCENE_HEIGHT FIRST_FROM_BORDER)
                       (place-image BLOCK
                                    FIRST_FROM_BORDER
                                    (- SCENE_HEIGHT FIRST_FROM_BORDER)
                                    BG)))))))))))

(define (tetris_render tet)
  (draw_blocks (tetris-block tet) (tetris-landscape tet)))

; Block Landscape -> Image
; Handles recursive processing of Block and Landscape
; for (tetris_render) function
; Tests under (tetris_render)
(define (draw_blocks falling resting)
  (cond
    [(empty? resting)
     (place-image BLOCK (posn-x falling) (posn-y falling) BG)]
    [else
     (place-image BLOCK
                  (posn-x (first resting))
                  (posn-y (first resting))
                  (draw_blocks falling (rest resting)))]))

; Tetris -> Tetris
; Updates the location of the falling block per tick
(check-expect (time_step first_block_spawn)
              (make-tetris
               (make-posn XCENTER
                          (+ (posn-y (tetris-block first_block_spawn))
                             FALL_SLOW))
               '() FALL_SLOW))
(check-expect (time_step first_block_landed)
              (make-tetris
               (make-posn XCENTER FIRST_FROM_BORDER)
               (list
                (make-posn XCENTER (- SCENE_HEIGHT FIRST_FROM_BORDER)))
               FALL_SLOW))
(check-expect (time_step block_on_block)
              (make-tetris
               (make-posn XCENTER FIRST_FROM_BORDER)
               (list
                (make-posn XCENTER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn XCENTER (- SCENE_HEIGHT FIRST_FROM_BORDER)))
               FALL_SLOW))

(define (time_step tet)
  (cond
    [(collision_bottom? (tetris-block tet) (tetris-landscape tet))
     (make-tetris
      (make-posn XCENTER FIRST_FROM_BORDER)
      (cons (tetris-block tet) (tetris-landscape tet))
      (tetris-speed tet))]
    [else
     (make-tetris
      (make-posn
       (posn-x (tetris-block tet))
       (+ (posn-y (tetris-block tet)) (tetris-speed tet)))
      (tetris-landscape tet)
      (tetris-speed tet))]))

; Block Landscape -> Boolean
; Has the falling block landed on top of another block or the
; the bottom of the scene
(check-expect (collision_bottom? (tetris-block first_block_spawn)
                                 (tetris-landscape first_block_spawn))
              #false)
(check-expect (collision_bottom? (tetris-block first_block_dropping)
                                 (tetris-landscape first_block_dropping))
              #false)
(check-expect (collision_bottom? (tetris-block first_block_landed)
                                 (tetris-landscape first_block_landed))
              #true)
(check-expect (collision_bottom? (tetris-block block_on_block)
                                 (tetris-landscape block_on_block))
              #true)
(check-expect (collision_bottom? (tetris-block full_stack)
                                 (tetris-landscape full_stack))
              #true)
(check-expect (collision_bottom? (tetris-block full_row)
                                 (tetris-landscape full_row))
              #true)

(define (collision_bottom? block lscape)
  (cond
    [(empty? lscape)
     (= (- SCENE_HEIGHT (posn-y block))
        HALF_BLOCK_SIZE)]
    [else
     (or (= (- (posn-y (first lscape)) (posn-y block))
            BLOCK_SIZE)
         (collision_bottom? block (rest lscape)))]))

; Tetris Direction -> Tetris
; Shifts the falling block to either side and alters falling speed
(check-expect (alter_movement first_block_spawn "left")
              (make-tetris
               (make-posn (+ XCENTER GO_LEFT) FIRST_FROM_BORDER)
               '() FALL_SLOW))
(check-expect (alter_movement block_dropping "right")
              (make-tetris
               (make-posn (+ XCENTER GO_RIGHT) YCENTER)
               '() FALL_SLOW))
(check-expect (alter_movement next_block_spawn "down")
              (make-tetris
               (make-posn XCENTER FIRST_FROM_BORDER)
               (list (make-posn XCENTER
                                (- SCENE_HEIGHT FIRST_FROM_BORDER)))
               FALL_FAST))
(check-expect (alter_movement next_block_spawn "up")
              (make-tetris
               (make-posn XCENTER FIRST_FROM_BORDER)
               (list (make-posn XCENTER
                                (- SCENE_HEIGHT FIRST_FROM_BORDER)))
               FALL_SLOW))
(check-expect (alter_movement max_left "left")
              max_left)
(check-expect (alter_movement max_left "right")
              (make-tetris
               (make-posn SECOND_FROM_BORDER YCENTER) '() FALL_SLOW))
(check-expect (alter_movement max_right "left")
              (make-tetris
               (make-posn (- SCENE_WIDTH SECOND_FROM_BORDER) YCENTER)
               '() FALL_SLOW))
(check-expect (alter_movement max_right "right")
              max_right)

(define (alter_movement tet key)
  (cond
    [(key=? key "up")
     (make-tetris (tetris-block tet) (tetris-landscape tet) FALL_SLOW)]
    [(key=? key "down")
     (make-tetris (tetris-block tet) (tetris-landscape tet) FALL_FAST)]
    [(and (key=? key "left")
          (not (collision_left?
                (tetris-block tet) (tetris-landscape tet))))
     (make-tetris
      (make-posn (+ (posn-x (tetris-block tet)) GO_LEFT)
                 (posn-y (tetris-block tet)))
      (tetris-landscape tet)
      (tetris-speed tet))]
    [(and (key=? key "right")
          (not (collision_right?
                (tetris-block tet) (tetris-lanscape tet))))
     (make-tetris
      (make-posn (+ (posn-x (tetris-block tet)) GO_RIGHT)
                 (posn-y (tetris-block tet)))
      (tetris-landscape tet)
      (tetris-speed tet))]
    [else tet]))

; Block Landscape -> Boolean
; Is there anything to the left of the falling block


(define (collision_left? block lscape) #false)

; Block Landscape -> Boolean
; Is there anything to the right of the falling block


(define (collision_right? block lscape) #false)

; MAIN /////////////////////////////////////////////////////////////////////////

; Tetris -> Tetris
(define (tetris_main tet)
  (big-bang tet
    [to-draw tetris_render]
    [on-tick time_step]
    [on-key alter_movement]))

(tetris_main (make-tetris
              (make-posn XCENTER FIRST_FROM_BORDER)
              '() FALL_SLOW))
