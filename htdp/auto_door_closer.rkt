;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname auto_door_closer) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 21, 2023

Sample problem: automatic door closer.
If locked, can be unlocked w/ a key
Closed, unlocked can be opened by pushing
Closed can be locked with a key
|#

(require 2htdp/universe)

; A DoorState is one of the following:
; -- LOCKED: can be unlocked
; -- CLOSED: can be locked / pushed open
; -- OPEN: automatically becomes CLOSED
; after some time

(define LOCKED "locked")
(define CLOSED "closed")
(define OPEN "open")

(define LOCK_ACT "l")
(define UNLOCK_ACT "u")
(define OPEN_ACT " ")

; DoorState -> DoorState
; If DoorState is OPEN, closes the
; door during one tick
(check-expect (door_closer LOCKED) LOCKED)
(check-expect (door_closer CLOSED) CLOSED)
(check-expect (door_closer OPEN) CLOSED)
(define (door_closer dc_ds)
  (cond[(string=? dc_ds LOCKED) LOCKED]
       [(string=? dc_ds CLOSED) CLOSED]
       [(string=? dc_ds OPEN) CLOSED]))

; DoorState KeyEvent -> DoorState
; Detects actions (key events) and determines
; if they are valid based on current DoorState
(check-expect (door_action LOCKED OPEN_ACT) LOCKED)
(check-expect (door_action LOCKED LOCK_ACT) LOCKED)
(check-expect (door_action LOCKED UNLOCK_ACT) CLOSED)
(check-expect (door_action CLOSED OPEN_ACT) OPEN)
(check-expect (door_action CLOSED LOCK_ACT) LOCKED)
(check-expect (door_action CLOSED UNLOCK_ACT) CLOSED)
(check-expect (door_action OPEN OPEN_ACT) OPEN)
(check-expect (door_action OPEN LOCK_ACT) OPEN)
(check-expect (door_action OPEN UNLOCK_ACT) OPEN)
(define (door_action da_ds da_ke) ...)

; DoorState -> Image
; Renders image based on current DoorState
(define (door_render dr_ds) ...)

; DoorState -> DoorState
(define (auto_close ac_ds)
  (big-bang ac_ds)
  [to-draw door_render]
  [on-tick door_closer 1]
  [on-key door_action])