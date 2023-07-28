#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 115. Revise light=? so that the error message specifies which
of the two arguments isn’t an element of TrafficLight.
|#

(define MESSAGE
  "traffic light expected, given some other value")

; Any -> Boolean
; is the given value an element of TrafficLight
(define (light? x)
  (cond
    [(string? x) (or (string=? "red" x)
                     (string=? "green" x)
                     (string=? "yellow" x))]
    [else #false]))

; Any Any -> Boolean
; are the two values elements of TrafficLight and,
; if so, are they equal
(check-expect (light=? "red" "red") #true)
(check-expect (light=? "red" "green") #false)
(check-expect (light=? "green" "green") #true)
(check-expect (light=? "yellow" "yellow") #true)

#|
(define (light=? a-value another-value)
  (if (and (light? a-value) (light? another-value))
      (string=? a-value another-value)
      (error MESSAGE)))
|#

(define (light=? val1 val2)
  (cond
    [(not (light? val1)) (error "First value is not a TrafficLight.")]
    [(not (light? val2)) (error "Second value is not a TrafficLight.")]
    [else
     (string=? val1 val2)]))
