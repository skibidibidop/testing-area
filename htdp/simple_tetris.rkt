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

(define BLOCK_SIZE SCALER)

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
(define (tetris_render tet) BG)
