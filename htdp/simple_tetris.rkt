#|
Author: Mark Beltran
Date: July 5, 2023

Project: Simple Tetris
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
(define full_stack
  (make-tetris (make-posn XCENTER HALF_BLOCK_SIZE)
               (list (make-posn XCENTER (- SCENE_HEIGHT HALF_BLOCK_SIZE))
                     (make-posn XCENTER (- SCENE_HEIGHT BLOCK_SIZE))
                     (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 3)))
                     (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 4)))
                     (make-posn XCENTER (- SCENE_HEIGHT (* HALF_BLOCK_SIZE 5)))
(define full_row ...)

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

(define (tetris_render tet) BG)
