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
(define-struct time [hrs mins secs])

(define S_IN_H 3600)
(define S_IN_M 60)

(define tester1 (make-time 13 0 45))
(define tester2 (make-time 22 11 35))

; time -> integer
; Converts time to seconds
(check-expect (time->seconds tester1) 46845)
(check-expect (time->seconds tester2) 79895)
(define (time->seconds user_time)
  (+ (* (time-hrs user_time) S_IN_H)
     (* (time-mins user_time) S_IN_M)
     (time-secs user_time)))
