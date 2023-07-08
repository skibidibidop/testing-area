#|
Author: Mark Beltran
Date: July 8, 2023

Chapter 12.8 Finite State Machines

Outline:
- (state=?)
- (simulate)
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)

(define SCN_WIDTH (* SCALER 10))
(define SCN_HEIGHT (* SCALER 10))

(define BG (empty-scene SCN_WIDTH SCN_HEIGHT))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct transition [current next])
; (make-transition FSM_state FSM_state)
; Interp.: (make-transition "green" "yellow"), represents the current state
; ("green") and the state to transition to ("yellow") in reaction to keystrokes

; An FSM_state is a Color

; An FSM is one of:
; - '()
; - (cons Transition FSM)
; Interp.: represents the transitions that a finite state machine can take
; from one state to another in reaction to keystrokes
(define fsm_traffic
  (list (make-transition "red" "green")
        (make-transition "green" "yellow")
        (make-transition "yellow" "red")))

; A State_v1 is an FSM_state

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Any -> Boolean
; Is Any an FSM_state
(check-expect (state=? "red") #true)
(check-expect (state=? "green") #true)
(check-expect (state=? #true) #false)
(check-expect (state=? 3) #false)
(check-expect (state=? "z") #false)
(check-expect (state=? (make-transition "blue" "red")) #false)
(check-expect (state=? (list (make-transition "yellow" "green"))) #false)

(define (state=? in)
  (image-color? in))

; State_1 -> Image
; Renders a world state as an image
(define (render_v1 s)
  empty-image)

; State_1 KeyEvent -> State_1
; Finds the next state from ke and cs
(define (find_next_state_v1 cs ke)
  cs)


; MAIN /////////////////////////////////////////////////////////////////////////

; FSM -> ???
; Match the keys pressed with the given FSM
(define (simulate_v1 fsm0)
  (big-bang initial_state
    [to-draw render_v1]
    [on-key find_next_state_v1]))
