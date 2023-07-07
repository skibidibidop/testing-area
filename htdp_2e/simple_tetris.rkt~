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
- (tetris_main)
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)

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

(define GO_DOWN BLOCK_SIZE)
(define GO_LEFT (* BLOCK_SIZE -1))
(define GO_RIGHT BLOCK_SIZE)

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct tetris [block landscape])
; (make-tetris Block Landscape)
; Interp.: (make-tetris b0 (list b1 b2 ...)) represents the falling block (b0)
; and the resting blocks (list b1 b2 ...)

; A Landscape is one of:
; - '()
; - (cons Block Landscape)

; A Block is a Posn
; Interp.: (make-posn x y) represents coordinates of the Block's center point

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Tetris -> Image
; Turns tetris instance to an image
(define first_block_spawn
  (make-tetris (make-posn XCENTER HALF_BLOCK_SIZE)
               '()))
(define first_block_dropping
  (make-tetris (make-posn XCENTER YCENTER)
               '()))
(define first_block_landed
  (make-tetris (make-posn XCENTER (- SCENE_HEIGHT HALF_BLOCK_SIZE))
               '()))
(define next_block_spawn
  (make-tetris (make-posn XCENTER HALF_BLOCK_SIZE)
               (list (make-posn XCENTER
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE)))))
(define block_on_block
  (make-tetris (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 3)))
               (list (make-posn XCENTER
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE)))))
; Blocks are added to the front of the list to avoid having to
; reverse the list
(define full_stack
  (make-tetris (make-posn XCENTER HALF_BLOCK_SIZE)
               (list (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 17)))
                     (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 15)))
                     (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 13)))
                     (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 11)))
                     (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 9)))
                     (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 7)))
                     (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 5)))
                     (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 3)))
                     (make-posn XCENTER (- SCENE_HEIGHT HALF_BLOCK_SIZE)))))
                                        
(define full_row
  (make-tetris (make-posn HALF_BLOCK_SIZE (- SCENE_HEIGHT HALF_BLOCK_SIZE))
               (list (make-posn (- SCENE_WIDTH (* HALF_BLOCK_SIZE 17))
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE))
                     (make-posn (- SCENE_WIDTH (* HALF_BLOCK_SIZE 15))
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE))
                     (make-posn (- SCENE_WIDTH (* HALF_BLOCK_SIZE 13))
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE))
                     (make-posn (- SCENE_WIDTH (* HALF_BLOCK_SIZE 11))
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE))
                     (make-posn (- SCENE_WIDTH (* HALF_BLOCK_SIZE 9))
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE))
                     (make-posn (- SCENE_WIDTH (* HALF_BLOCK_SIZE 7))
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE))
                     (make-posn (- SCENE_WIDTH (* HALF_BLOCK_SIZE 5))
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE))
                     (make-posn (- SCENE_WIDTH (* HALF_BLOCK_SIZE 3))
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE))
                     (make-posn (- SCENE_WIDTH HALF_BLOCK_SIZE)
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE)))))


(check-expect (tetris_render first_block_spawn)
              (place-image BLOCK XCENTER HALF_BLOCK_SIZE
                           BG))
(check-expect (tetris_render first_block_dropping)
              (place-image BLOCK XCENTER YCENTER
                           BG))
(check-expect (tetris_render first_block_landed)
              (place-image BLOCK XCENTER (- SCENE_HEIGHT HALF_BLOCK_SIZE)
                           BG))
(check-expect (tetris_render next_block_spawn)
              (place-image
               BLOCK XCENTER (- SCENE_HEIGHT HALF_BLOCK_SIZE)
               (place-image
                BLOCK XCENTER HALF_BLOCK_SIZE
                BG)))
(check-expect (tetris_render block_on_block)
              (place-image
               BLOCK XCENTER (- SCENE_HEIGHT HALF_BLOCK_SIZE)
               (place-image
                BLOCK XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 3))
                BG)))
(check-expect (tetris_render full_stack)
              (place-image
               BLOCK XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 17))
               (place-image
                BLOCK XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 15))
                (place-image
                 BLOCK XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 13))
                 (place-image
                  BLOCK XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 11))
                  (place-image
                   BLOCK XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 9))
                   (place-image
                    BLOCK XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 7))
                    (place-image
                     BLOCK XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 5))
                     (place-image
                      BLOCK XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 3))
                      (place-image
                       BLOCK XCENTER (- SCENE_HEIGHT HALF_BLOCK_SIZE)
                       (place-image
                        BLOCK XCENTER HALF_BLOCK_SIZE BG)))))))))))
(check-expect (tetris_render full_row)
              (place-image
               BLOCK (- SCENE_WIDTH (* HALF_BLOCK_SIZE 17))
               (- SCENE_HEIGHT HALF_BLOCK_SIZE)
               (place-image BLOCK
                            (- SCENE_WIDTH (* HALF_BLOCK_SIZE 15))
                            (- SCENE_HEIGHT HALF_BLOCK_SIZE)
                (place-image BLOCK
                             (- SCENE_WIDTH (* HALF_BLOCK_SIZE 13))
                             (- SCENE_HEIGHT HALF_BLOCK_SIZE)
                 (place-image BLOCK
                              (- SCENE_WIDTH (* HALF_BLOCK_SIZE 11))
                              (- SCENE_HEIGHT HALF_BLOCK_SIZE)
                  (place-image BLOCK
                               (- SCENE_WIDTH (* HALF_BLOCK_SIZE 9))
                               (- SCENE_HEIGHT HALF_BLOCK_SIZE)
                   (place-image BLOCK
                                (- SCENE_WIDTH (* HALF_BLOCK_SIZE 7))
                                (- SCENE_HEIGHT HALF_BLOCK_SIZE)
                    (place-image BLOCK
                                 (- SCENE_WIDTH (* HALF_BLOCK_SIZE 5))
                                 (- SCENE_HEIGHT HALF_BLOCK_SIZE)
                     (place-image BLOCK
                                  (- SCENE_WIDTH (* HALF_BLOCK_SIZE 3))
                                  (- SCENE_HEIGHT HALF_BLOCK_SIZE)
                      (place-image BLOCK
                                   (- SCENE_WIDTH HALF_BLOCK_SIZE)
                                   (- SCENE_HEIGHT HALF_BLOCK_SIZE)
                       (place-image BLOCK
                                    HALF_BLOCK_SIZE
                                    (- SCENE_HEIGHT HALF_BLOCK_SIZE)
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
               (make-posn XCENTER (* HALF_BLOCK_SIZE 3))
               '()))
(check-expect (time_step first_block_landed)
              (make-tetris
               (make-posn XCENTER HALF_BLOCK_SIZE)
               (list
                (make-posn XCENTER (- SCENE_HEIGHT HALF_BLOCK_SIZE)))))
(check-expect (time_step block_on_block)
              (make-tetris
               (make-posn XCENTER HALF_BLOCK_SIZE)
               (list
                (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 3)))
                (make-posn XCENTER (- SCENE_HEIGHT HALF_BLOCK_SIZE)))))

(define (time_step tet) tet)

#|
; Tetris -> Tetris
(define (tetris_main tet)
  (big-bang tet
    [to-draw tetris_render]
    [on-tick ...]
    [on-key ...]
    [stop-when ...]))
|#
