;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname points_in_time) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: May 23, 2023

Structure type and data definitions for
representing points in time since midnight.
|#

; A second is a Number
; Any number from 0 to 59. If 60, minute is increased by
; 1 and second is reset to 0.
; Interpretation: 60 seconds is equivalent to 1 minute

; A minute is a Number
; Any number from 0 to 59. If 60, hour is increased by
; 1 and minute is reset to 0.
; Interpretation: 60 minutes is equivalent to 1 hour

; An hour is a Number
; Any number from 0 to 23. If 24, hour is reset to 0
; Interpretation: 3 means 3 hours from midnight

; A time is a structure:
;  (make-time [hours minutes seconds])
; Interpretation: Represents the amount of time elapsed
; after midnight.
; 0 12 35 is 12 minutes and 35 seconds after midnight
; 5 30 43 is 5 hours 30 minutes and 43 seconds after midnight