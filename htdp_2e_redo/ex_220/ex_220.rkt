#|
Author: Mark Beltran
Date: August 5, 2023

Solution for exercises 220 to 223 in ex 220
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

(define TICK_RATE 0.1)
(define FALL_RATE HALF_BLOCK_SIZE)
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

(define FONT_SIZE (* SCALER 0.5))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct tetris [block landscape])
; (make-tetris Block Landscape)
; Interp.: (make-tetris b0 (list b1 b2 ...)) represents the
; falling block (b0) and resting blocks (list b1 b2 ...)

; A Landscape is one of:
; - '()
; - (cons Block Landscape)

; A Block is a Posn
; Interp.: (make-posn x y) represents coordinates of the Block's center point

; A Direction is one of:
; - "left"
; - "right"
; Interp.: represents key events (left/right arrows pressed)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

(define first_block_spawn
  (make-tetris (make-posn FIRST_FROM_BORDER FIRST_FROM_BORDER) '()))
(define first_block_dropping
  (make-tetris (make-posn FIRST_FROM_BORDER YCENTER) '()))
(define first_block_landed
  (make-tetris (make-posn FIRST_FROM_BORDER
                          (- SCENE_HEIGHT HALF_BLOCK_SIZE)) '()))
(define next_block_spawn
  (make-tetris (make-posn FIRST_FROM_BORDER FIRST_FROM_BORDER)
               (list (make-posn FIRST_FROM_BORDER
                                (- SCENE_HEIGHT FIRST_FROM_BORDER)))))
(define block_on_block
  (make-tetris (make-posn FIRST_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))
               (list (make-posn FIRST_FROM_BORDER
                                (- SCENE_HEIGHT FIRST_FROM_BORDER)))))
; Blocks are added to the beginning of the list to avoid having to
; reverse the list
(define full_stack
  (make-tetris (make-posn FIRST_FROM_BORDER FIRST_FROM_BORDER)
               (list
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT NINTH_FROM_BORDER))
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT EIGHTH_FROM_BORDER))
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT SEVENTH_FROM_BORDER))
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT SIXTH_FROM_BORDER))
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT FIFTH_FROM_BORDER))
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT FOURTH_FROM_BORDER))
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT THIRD_FROM_BORDER))
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT FIRST_FROM_BORDER)))))
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
                                (- SCENE_HEIGHT FIRST_FROM_BORDER)))))
(define max_left
  (make-tetris (make-posn FIRST_FROM_BORDER YCENTER) '()))
(define max_right
  (make-tetris (make-posn (- SCENE_WIDTH FIRST_FROM_BORDER) YCENTER) '()))

; Tetris -> Image
; Turns tetris instance to an image
(check-expect (tetris_render first_block_spawn)
              (place-image BLOCK FIRST_FROM_BORDER FIRST_FROM_BORDER
                           BG))
(check-expect (tetris_render first_block_dropping)
              (place-image BLOCK FIRST_FROM_BORDER YCENTER
                           BG))
(check-expect (tetris_render first_block_landed)
              (place-image BLOCK
                           FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER)
                           BG))
(check-expect (tetris_render next_block_spawn)
              (place-image
               BLOCK FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER)
               (place-image
                BLOCK FIRST_FROM_BORDER FIRST_FROM_BORDER
                BG)))
(check-expect (tetris_render block_on_block)
              (place-image
               BLOCK FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER)
               (place-image
                BLOCK FIRST_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER)
                BG)))
(check-expect (tetris_render full_stack)
              (place-image
               BLOCK FIRST_FROM_BORDER
               (- SCENE_HEIGHT NINTH_FROM_BORDER)
               (place-image
                BLOCK FIRST_FROM_BORDER
                (- SCENE_HEIGHT EIGHTH_FROM_BORDER)
                (place-image
                 BLOCK FIRST_FROM_BORDER
                 (- SCENE_HEIGHT SEVENTH_FROM_BORDER)
                 (place-image
                  BLOCK FIRST_FROM_BORDER
                  (- SCENE_HEIGHT SIXTH_FROM_BORDER)
                  (place-image
                   BLOCK FIRST_FROM_BORDER
                   (- SCENE_HEIGHT FIFTH_FROM_BORDER)
                   (place-image
                    BLOCK FIRST_FROM_BORDER
                    (- SCENE_HEIGHT FOURTH_FROM_BORDER)
                    (place-image
                     BLOCK FIRST_FROM_BORDER
                     (- SCENE_HEIGHT THIRD_FROM_BORDER)
                     (place-image
                      BLOCK FIRST_FROM_BORDER
                      (- SCENE_HEIGHT SECOND_FROM_BORDER)
                      (place-image
                       BLOCK FIRST_FROM_BORDER
                       (- SCENE_HEIGHT FIRST_FROM_BORDER)
                       (place-image
                        BLOCK FIRST_FROM_BORDER
                        FIRST_FROM_BORDER BG)))))))))))
(check-expect (tetris_render full_row)
              (place-image
               BLOCK (- SCENE_WIDTH NINTH_FROM_BORDER)
               (- SCENE_HEIGHT FIRST_FROM_BORDER)
               (place-image
                BLOCK (- SCENE_WIDTH EIGHTH_FROM_BORDER)
                (- SCENE_HEIGHT FIRST_FROM_BORDER)
                (place-image
                 BLOCK (- SCENE_WIDTH SEVENTH_FROM_BORDER)
                 (- SCENE_HEIGHT FIRST_FROM_BORDER)
                 (place-image
                  BLOCK (- SCENE_WIDTH SIXTH_FROM_BORDER)
                  (- SCENE_HEIGHT FIRST_FROM_BORDER)
                  (place-image
                   BLOCK
                   (- SCENE_WIDTH FIFTH_FROM_BORDER)
                   (- SCENE_HEIGHT FIRST_FROM_BORDER)
                   (place-image
                    BLOCK
                    (- SCENE_WIDTH FOURTH_FROM_BORDER)
                    (- SCENE_HEIGHT FIRST_FROM_BORDER)
                    (place-image
                     BLOCK
                     (- SCENE_WIDTH THIRD_FROM_BORDER)
                     (- SCENE_HEIGHT FIRST_FROM_BORDER)
                     (place-image
                      BLOCK
                      (- SCENE_WIDTH SECOND_FROM_BORDER)
                      (- SCENE_HEIGHT FIRST_FROM_BORDER)
                      (place-image
                       BLOCK
                       (- SCENE_WIDTH FIRST_FROM_BORDER)
                       (- SCENE_HEIGHT FIRST_FROM_BORDER)
                       (place-image
                        BLOCK
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
               (make-posn FIRST_FROM_BORDER
                          (+ (posn-y (tetris-block first_block_spawn))
                             FALL_RATE))
               '()))
(check-expect (time_step first_block_landed)
              (make-tetris
               (make-posn FIRST_FROM_BORDER FIRST_FROM_BORDER)
               (list
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT FIRST_FROM_BORDER)))))
(check-expect (time_step block_on_block)
              (make-tetris
               (make-posn FIRST_FROM_BORDER FIRST_FROM_BORDER)
               (list
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn FIRST_FROM_BORDER
                           (- SCENE_HEIGHT FIRST_FROM_BORDER)))))

(define (time_step tet)
  (cond
    [(collision_bottom? (tetris-block tet) (tetris-landscape tet))
     (make-tetris
      (make-posn FIRST_FROM_BORDER FIRST_FROM_BORDER)
      (cons (tetris-block tet) (tetris-landscape tet)))]
    [else
     (make-tetris
      (make-posn
       (posn-x (tetris-block tet))
       (+ (posn-y (tetris-block tet)) FALL_RATE))
      (tetris-landscape tet))]))

; Block Landscape -> Boolean
; Has the falling block landed on top of another block or
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
     (= (posn-y block)
        (- SCENE_HEIGHT FIRST_FROM_BORDER))]
    [else
     (or (and (= (- (posn-y (first lscape)) (posn-y block))
                 BLOCK_SIZE)
              (< (abs (- (posn-x block) (posn-x (first lscape))))
                 BLOCK_SIZE))
         (collision_bottom? block (rest lscape)))]))

; Tetris Direction -> Tetris
; Shifts the falling block to either side and alters falling speed
(check-expect (alter_movement first_block_spawn "left")
              first_block_spawn)
(check-expect (alter_movement first_block_dropping "right")
              (make-tetris
               (make-posn (+ FIRST_FROM_BORDER GO_RIGHT) YCENTER)
               '()))
(check-expect (alter_movement max_left "left")
              max_left)
(check-expect (alter_movement max_left "right")
              (make-tetris
               (make-posn SECOND_FROM_BORDER YCENTER) '()))
(check-expect (alter_movement max_right "left")
              (make-tetris
               (make-posn (- SCENE_WIDTH SECOND_FROM_BORDER) YCENTER)
               '()))
(check-expect (alter_movement max_right "right")
              max_right)

(define (alter_movement tet key)
  (cond
    [(and (key=? key "left")
          (not (collision_left?
                (tetris-block tet) (tetris-landscape tet))))
     (make-tetris
      (make-posn (+ (posn-x (tetris-block tet)) GO_LEFT)
                 (posn-y (tetris-block tet)))
      (tetris-landscape tet))]
    [(and (key=? key "right")
          (not (collision_right?
                (tetris-block tet) (tetris-landscape tet))))
     (make-tetris
      (make-posn (+ (posn-x (tetris-block tet)) GO_RIGHT)
                 (posn-y (tetris-block tet)))
      (tetris-landscape tet))]
    [else tet]))

; Block Landscape -> Boolean
; Is there anything to the left of the falling block
(check-expect (collision_left?
               (make-posn XCENTER FIRST_FROM_BORDER) '())
              #false)
(check-expect (collision_left?
               (make-posn XCENTER YCENTER) '())
              #false)
(check-expect (collision_left?
               (make-posn XCENTER (- SCENE_HEIGHT FIRST_FROM_BORDER)) '())
              #false)
(check-expect (collision_left?
               (make-posn FIRST_FROM_BORDER FIRST_FROM_BORDER) '())
              #true)
(check-expect (collision_left?
               (make-posn FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
               '())
              #true)
(check-expect (collision_left?
               (make-posn (- SCENE_WIDTH FIRST_FROM_BORDER) FIRST_FROM_BORDER)
               '())
              #false)
(check-expect (collision_left?
               (make-posn (- SCENE_WIDTH FIRST_FROM_BORDER)
                          (- SCENE_HEIGHT FIRST_FROM_BORDER))
               '())
              #false)
(check-expect (collision_left?
               (make-posn SECOND_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))
               (list
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 SECOND_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))))
              #true)
(check-expect (collision_left?
               (make-posn SECOND_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))
               (list
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 SECOND_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))))
              #true)
(check-expect (collision_left?
               (make-posn SECOND_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))
               (list
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 SECOND_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))))
              #false)

(define (collision_left? block lscape)
  (cond
    [(empty? lscape)
     (= (posn-x block) FIRST_FROM_BORDER)]
    [else
     (or (= (posn-x block) FIRST_FROM_BORDER)
         (and (> (- (posn-x block) (posn-x (first lscape)))
                 0)
              (= (- (posn-x block) (posn-x (first lscape)))
                 BLOCK_SIZE)
              (< (abs (- (posn-y block) (posn-y (first lscape))))
                 BLOCK_SIZE))
         (collision_left? block (rest lscape)))]))

; Block Landscape -> Boolean
; Is there anything to the right of the falling block
(check-expect (collision_right?
               (make-posn XCENTER FIRST_FROM_BORDER) '())
              #false)
(check-expect (collision_right?
               (make-posn XCENTER YCENTER) '())
              #false)
(check-expect (collision_right?
               (make-posn XCENTER (- SCENE_HEIGHT FIRST_FROM_BORDER)) '())
              #false)
(check-expect (collision_right?
               (make-posn FIRST_FROM_BORDER FIRST_FROM_BORDER) '())
              #false)
(check-expect (collision_right?
               (make-posn FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
               '())
              #false)
(check-expect (collision_right?
               (make-posn (- SCENE_WIDTH FIRST_FROM_BORDER) FIRST_FROM_BORDER)
               '())
              #true)
(check-expect (collision_right?
               (make-posn (- SCENE_WIDTH FIRST_FROM_BORDER)
                          (- SCENE_HEIGHT FIRST_FROM_BORDER))
               '())
              #true)
(check-expect (collision_right?
               (make-posn SECOND_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))
               (list
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 SECOND_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))))
              #true)
(check-expect (collision_right?
               (make-posn SECOND_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))
               (list
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 SECOND_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))))
              #false)
(check-expect (collision_right?
               (make-posn SECOND_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))
               (list
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn
                 FIRST_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 SECOND_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT FIRST_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT SECOND_FROM_BORDER))
                (make-posn
                 THIRD_FROM_BORDER (- SCENE_HEIGHT THIRD_FROM_BORDER))))
              #true)

(define (collision_right? block lscape)
  (cond
    [(empty? lscape)
     (= (posn-x block) (- SCENE_WIDTH FIRST_FROM_BORDER))]
    [else
     (or (= (posn-x block) (- SCENE_WIDTH FIRST_FROM_BORDER))
         (and (< (- (posn-x block) (posn-x (first lscape)))
                 0)
              (= (- (posn-x (first lscape)) (posn-x block))
                 BLOCK_SIZE)
              (< (abs (- (posn-y block) (posn-y (first lscape))))
                 BLOCK_SIZE))
         (collision_right? block (rest lscape)))]))

; Tetris -> Boolean
; Is a resting block touching the top of the scene
(check-expect (game_over? first_block_spawn) #false)
(check-expect (game_over? block_on_block) #false)
(check-expect (game_over? first_block_dropping) #false)
(check-expect (game_over?
               (make-tetris
                (make-posn FIRST_FROM_BORDER FIRST_FROM_BORDER)
                (cons (make-posn FIRST_FROM_BORDER FIRST_FROM_BORDER)
                      (tetris-landscape full_stack))))
              #true)

(define (game_over? tet)
  (cond
    [(empty? (tetris-landscape tet)) #false]
    [else
     (= (posn-y (first (tetris-landscape tet))) FIRST_FROM_BORDER)]))

; Tetris -> Image
; Shows final score when game is over
(define (show_final_score tet)
  (place-images
   (list (text "Final score: " FONT_SIZE "red")
         (text (number->string
                (length (tetris-landscape tet)))
               FONT_SIZE "red"))
   (list (make-posn (- XCENTER BLOCK_SIZE) YCENTER)
         (make-posn (+ XCENTER BLOCK_SIZE) YCENTER))
   BG))

; MAIN /////////////////////////////////////////////////////////////////////////

; Tetris -> Tetris
(define (tetris_main tet)
  (big-bang tet
    [to-draw tetris_render]
    [on-tick time_step TICK_RATE]
    [on-key alter_movement]
    [stop-when game_over? show_final_score]))

(tetris_main (make-tetris
              (make-posn FIRST_FROM_BORDER FIRST_FROM_BORDER)
              '()))
