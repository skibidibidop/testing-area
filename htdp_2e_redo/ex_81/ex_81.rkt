#|
Author: Mark Beltran
Date: July 21, 2023

Exercise 81. Design the function time->seconds, which consumes
instances of time structures (see exercise 77) and produces the number of
seconds that have passed since midnight. For example, if you are representing
12 hours, 30 minutes, and 2 seconds with one of these structures
and if you then apply time->seconds to this instance, the correct result
is 45002.
|#

(define SECS_PER_MIN 60)
(define SECS_PER_HR 3600)

; An Hours is one of:
; 0
; ...
; 23
; Interp.: represents hours elapsed since midnight (00:00:00)

; A Minutes is one of:
; 0
; ...
; 59
; Interp.: represents minutes elapsed since the most recent Hour

; A Seconds is one of:
; 0
; ...
; 59
; Interp.: represents seconds elapsed since the most recent Minute

(define-struct time_new [hr min sec])
; (make-time Hours Minutes Seconds)
; Interp.: (make-time h m s), represents the hours (h), minutes (m),
; and seconds (s) that have elapsed since midnight (00:00:00)

; Time -> Number
; Converts Time t to seconds
(check-expect (time->seconds (make-time_new 0 0 0)) 0)
(check-expect (time->seconds (make-time_new 0 0 59)) 59)
(check-expect (time->seconds (make-time_new 0 59 0)) 3540)
(check-expect (time->seconds (make-time_new 23 0 0)) 82800)
(check-expect (time->seconds (make-time_new 23 59 59)) 86399)

(define (time->seconds t)
  (+ (* (time_new-hr t) SECS_PER_HR)
     (* (time_new-min t) SECS_PER_MIN)
     (time_new-sec t)))
  
