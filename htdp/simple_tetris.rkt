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

; DATA DEFINITION //////////////////////////////////////////////////////////////

; FUNCTIONS ////////////////////////////////////////////////////////////////////
