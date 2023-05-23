#|
Author: Mark Beltran
Date: May 24, 2023

Convert time (hh:mm:ss) to seconds.
|#

; A non_hour_time is a positive integer
; from 0 to 59
; Interpretation: can represent seconds
; and minutes

; An hour_time is a positive integer
; from 0 to 23
; Interpretation: represents hours passed
; since midnight

; A time is a structure:
; (make-time hour_time non_hour_time non_hour_time)
; Interpretation: represents time passed
; since midnight
