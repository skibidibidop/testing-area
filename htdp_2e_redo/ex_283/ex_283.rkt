#|
Author: Mark Beltran
Date: August 12, 2023

Exercise 283. Confirm that DrRacket’s stepper can deal with lambda.
Use it to step through the third example and also to determine how DrRacket
evaluates the following expressions:
|#

; Result: (list 10 20 30)
(map (lambda (x) (* 10 x))
     '(1 2 3))

; Result: "Matthew, Robby, etc."
(foldl (lambda (name rst)
         (string-append name ", " rst))
       "etc."
       '("Matthew" "Robby"))

(define-struct ir [name price])
(define th 10)

; Result: (list (make-ir "bear" 10))
(filter (lambda (ir) (<= (ir-price ir) th))
        (list (make-ir "bear" 10)
              (make-ir "doll" 33)))
