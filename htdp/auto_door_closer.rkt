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

; DoorState -> DoorState
; If DoorState is OPEN, closes the
; door during one tick
(define (door_closer dc_ds) ...)

; DoorState KeyEvent -> DoorState
; Detects actions (key events) and determines
; if they are valid based on current DoorState
(define (door_action da_ds da_ke) ...)

; DoorState -> Image
; Renders image based on current DoorState)
(define door_render dr_ds) ...)