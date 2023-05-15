#|
Author: Mark Beltran
Date: May 16, 2023

If sunny is false or friday is true,
the output is #true.
|#

(define sun_stat #true)
(define fri_stat #false)

(define (sunfri sunny friday)
  (if (or (false? sunny) (false? (not fri_stat)))
      #true
      #false))

(sunfri sun_stat fri_stat)
