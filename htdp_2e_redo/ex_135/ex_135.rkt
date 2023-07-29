#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 135. Use DrRacket’s stepper to check the calculation for

(contains-flatt? (cons "Flatt" (cons "C" '())))

Also use the stepper to determine the value of

(contains-flatt?
  (cons "A" (cons "Flatt" (cons "C" '()))))

What happens when "Flatt" is replaced with "B"?
|#

; List-of-names -> Boolean
; determines whether "Flatt" occurs on alon
(check-expect
 (contains-flatt? (cons "X" (cons "Y" (cons "Z" '()))))
 #false)
(check-expect
 (contains-flatt? (cons "A" (cons "Flatt" (cons "C" '()))))
 #true)
(define (contains-flatt? alon)
  (cond
    [(empty? alon) #false]
    [(cons? alon)
     (or (string=? (first alon) "Flatt")
         (contains-flatt? (rest alon)))]))

; Result is #true
(contains-flatt? (cons "Flatt" (cons "C" '())))

; Result is #true
(contains-flatt?
 (cons "A" (cons "Flatt" (cons "C" '()))))


; Result is #false
(contains-flatt?
  (cons "A" (cons "B" (cons "C" '()))))
