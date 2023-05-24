#|
Author: Mark Beltran
Date: May 24, 2023

Space game?
|#

(require 2htdp/image)
(require 2htdp/universe)

; non_neg: a non-negative Integer
; Example: (define coord 50)
; Interpretation: integer >= 0, used to
; represent x-coordinate of tank

; space_game: a structure
; (make-space_game posn non_neg)
; Interpretation: (make-space_game (make-posn ufox ufoy) tankx)
; UFO's location at (ufox, ufoy), tank's x-coord at tankx
(define-struct space_game [ufo tank])
