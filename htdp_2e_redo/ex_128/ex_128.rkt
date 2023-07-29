#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 128. Copy the following tests into DrRacket’s definitions area:

(check-member-of "green" "red" "yellow" "grey")
(check-within (make-posn #i1.0 #i1.1)
(make-posn #i0.9 #i1.2) 0.01)
(check-range #i0.9 #i0.6 #i0.8)
(check-random (make-posn (random 3) (random 9))
(make-posn (random 9) (random 3)))
(check-satisfied 4 odd?)

Validate that all of them fail and explain why.
|#

(check-member-of "green" "red" "yellow" "grey")
(check-within (make-posn #i1.0 #i1.1)
              (make-posn #i0.9 #i1.2) 0.01)
(check-range #i0.9 #i0.6 #i0.8)
(check-random (make-posn (random 3) (random 9))
              (make-posn (random 9) (random 3)))
(check-satisfied 4 odd?)

#|
1. (check-member-of "green" "red" "yellow" "grey")
"green" is not a member

2. (check-within (make-posn #i1.0 #i1.1)
                 (make-posn #i0.9 #i1.2) 0.01)
difference not within 0.01

3. (check-range #i0.9 #i0.6 #i0.8)
first argument not between second and third argument values

4. (check-random (make-posn (random 3) (random 9))
                 (make-posn (random 9) (random 3)))
The ranges need to be the same for each (random)

5. (check-satisfied 4 odd?)
4 is even
|#
