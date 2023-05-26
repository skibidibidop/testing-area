#|
Author: Mark Beltran
Date: May 26, 2023

- Chameleon walks from left to right.
- If right border is reached, teleport to left border.
- Happiness gauge decreases over time.
- Happiness can be increased by 2 with keystroke "down".
- Keystroke "r" turns the chameleon red.
- Keystroke "b" turns the chameleon blue.
- Keystroke "g" turns the chameleon green.
|#

(define-struct wstate [h x])
; wstate: a structure
; (make-wstate Number Number)
; Interpretation: (make-wstate happiness cham_x)
; - wstate-h is the happiness gauge's center point.
; The happiness gauge being completely out of the scene
; represents depleted happiness.
; - wstate-x the chameleon's x-coordinate.
