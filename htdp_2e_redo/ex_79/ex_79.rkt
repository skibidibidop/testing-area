#|
Author: Mark Beltran
Date: July 21, 2023

Exercise 79. Create examples for the following data definitions:
|#

; A Color is one of:
; --- "white"
; --- "yellow"
; --- "orange"
; --- "green"
; --- "red"
; --- "blue"
; --- "black"

(define WHITE "white")
(define YELLOW "yellow")

; H is a Number between 0 and 100.
; interpretation represents a happiness value

(define HAP_EMPTY 0)
(define HAP_HALF 50)
(define HAP_FULL 100)

(define-struct person [fstname lstname male?])
; A Person is a structure:
; (make-person String String Boolean)
; Is it a good idea to use a field name that looks like the name of a
; predicate?

; If the field is supposed to contain a Boolean, it might be a good idea.

(make-person "First" "Last" #false)

(define-struct dog [owner name age happiness])
; A Dog is a structure:
; (make-dog Person String PositiveInteger H)
; Interp.: (make-dog o n a h)
; Contains the dog's owner name (o), name (n),
; age (a), and happiness level (h)

(make-dog ((make-person "First" "Last")
           "Good Boy" 10 100))

; A Weapon is one of:
; --- #false
; --- Posn
; interpretation #false means the missile hasn't
; been fired yet; a Posn means it is in flight
#|
The missile knows where it is at all times. It knows this because it
knows where it isn't. By subtracting where it is from where it isn't, or
where it isn't from where it is (whichever is greater), it obtains a
difference, or deviation. The guidance subsystem uses deviations to
generate corrective commands to drive the missile from a position where
it is to a position where it isn't, and arriving at a position where it
wasn't, it now is. Consequently, the position where it is, is now the
position that it wasn't, and it follows that the position that it was,
is now the position that it isn't. In the event that the position that it
is in is not the position that it wasn't, the system has acquired a variation,
the variation being the difference between where the missile is, and where it
wasn't. If variation is considered to be a significant factor, it too may be
corrected by the GEA. However, the missile must also know where it was.
The missile guidance computer scenario works as follows. Because a variation
has modified some of the information the missile has obtained, it is not sure
just where it is. However, it is sure where it isn't, within reason, and it
knows where it was. It now subtracts where it should be from where it wasn't,
or vice-versa, and by differentiating this from the algebraic sum of where it
shouldn't be, and where it was, it is able to obtain the deviation and its
variation, which is called error.
|#

(define PRIMED #false)
(define FIRED (make-posn 50 50))
