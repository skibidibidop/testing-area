#|
Author: Mark Beltran
Date: May 24, 2023

Space game?
|#

; non_neg: a non-negative Integer
; Example: (define coord 50)
; Interpretation: integer >= 0, used to
; represent x-coordinate of tank

; space_game: a structure
; (make-space_game [Number non_neg])
; Interpretation: distance (no. of pixels)
; of UFO from the top edge, distance of tank
; from the left edge
; Example: (define sample_sg 30 5)
(define-struct space_game [ufo tank])
