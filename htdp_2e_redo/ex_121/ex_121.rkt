#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 121. Evaluate the following expressions step-by-step:
|#


; 19
(+ (
    * (/ 12 8) 2/3)
   (- 20 (sqrt 4)))

; #false
(cond
  [(= 0 0) #false]
  [(> 0 1) (string=? "a" "a")]
  [else (= (/ 1 0) 9)])

; #true
(cond
  [(= 2 0) #false]
  [(> 2 1) (string=? "a" "a")]
  [else (= (/ 1 2) 9)])

; Use DrRacket’s stepper to confirm your computations.
