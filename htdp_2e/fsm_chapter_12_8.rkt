#|
Author: Mark Beltran
Date: July 8, 2023

Chapter 12.8 Finite State Machines

Outline:

|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An FSM is one of:
; - '()
; - (cons Transition FSM)
; Interp.: represents the transitions that a finite state machine can take
; from one state to another in reaction to keystrokes

(define-struct transition [current next])
; (make-transition FSM_state FSM_state)
; Interp.: (make-transition "green" "yellow"), represents the current state
; ("green") and the state to transition to ("yellow") in reaction to keystrokes

; An FSM_state is a Color

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

(define (state=? in) #false)
