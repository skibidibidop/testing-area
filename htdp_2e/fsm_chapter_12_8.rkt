;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname fsm_chapter_12_8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 8, 2023

Chapter 12.8 Finite State Machines

Outline:
- (state=?)
- (state_as_colored_square)
- (find_nxt_state)
- (simulate_v2)
|#

(require 2htdp/image)
(require 2htdp/universe)

(define SCALER 10)

(define BOX_SIZE (* SCALER 10))

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

; A State_v1 is an FSM_state

(define-struct fs [fsm current])
; A State_v2 is a structure:
; (make-fs FSM FSM_state)

(define fsm_traffic
  (list (make-transition "red" "green")
        (make-transition "green" "yellow")
        (make-transition "yellow" "red")))

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

; State_v2 -> Image
; Renders a world state as an image
(check-expect (state_as_colored_square
               (make-fs fsm_traffic "red"))
               (square BOX_SIZE "solid" "red"))

(define (state_as_colored_square an_fsm)
  (square BOX_SIZE "solid" (fs-current an_fsm)))

; State_v2 KeyEvent -> State_v2
; Finds the next state
(check-expect
 (find_next_state (make-fs fsm_traffic "red") "n")
 (make-fs fsm_traffic "green"))
(check-expect
 (find_next_state (make-fs fsm_traffic "red") "a")
 (make-fs fsm_traffic "green"))
(check-expect
 (find_next_state (make-fs fsm_traffic "green") "q")
 (make-fs fsm_traffic "yellow"))

(define (find_next_state an_fsm ke)
  (make-fs
   (fs-fsm an_fsm)
   (find (fs-fsm an_fsm) (fs-current an_fsm))))

; FSM FSM_state -> FSM_state
; Finds the state representing current in transitions
; and retrieves the next field
(check-expect (find fsm_traffic "red") "green")
(check-expect (find fsm_traffic "green") "yellow")
(check-expect (find fsm_traffic "black") "not found: black")

(define (find transitions current)
  (cond
    [(empty? transitions) "not found: black"]
    [else
     (cond
       [(string=? (transition-current (first transitions)) current)
        (transition-next (first transitions))]
       [else
        (find (rest transitions) current)])]))


; MAIN /////////////////////////////////////////////////////////////////////////

; FSM FSM_state -> State_v2
; Match the keys pressed with the given FSM
(define (simulate_v2 an_fsm s0)
  (big-bang (make-fs an_fsm s0)
    [to-draw state_as_colored_square]
    [on-key find_next_state]))

(simulate_v2 fsm_traffic "red")
