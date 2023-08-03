#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 165. Design the function subst-robot, which consumes a
list of toy descriptions (one-word strings) and replaces all occurrences of
"robot" with "r2d2"; all other descriptions remain the same.

Generalize subst-robot to substitute. The latter consumes two
strings, called new and old, and a list of strings. It produces a new list of
strings by substituting all occurrences of old with new.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A List-of-toydesc is one of:
; '()
; (cons Toy_desc List-of-toydesc)
; Interp.: a list of Toy_descs

; A Toy_desc is a String
; Interp.: a one-word string describing a toy

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; List-of-toydesc -> List-of-toydesc
; Replaces all occurrences of "robot" with "r2d2"
(check-expect (subst-robot '()) '())
(check-expect (subst-robot (list "hard" "square")) (list "hard" "square"))
(check-expect (subst-robot (list "hard" "robot" "square" "robot"))
              (list "hard" "r2d2" "square" "r2d2"))

(define (subst-robot lotd)
  (cond
    [(empty? lotd) '()]
    [else
     (cons
      (cond
        [(string=? (first lotd) "robot") "r2d2"]
        [else (first lotd)])
      (subst-robot (rest lotd)))]))

; String String List-of-strings
; Replaces all occurrences of old with new in String los
(check-expect (substitute "hey" "there" '()) '())
(check-expect (substitute "hey" "there"
                          (list "hey" "there" "hello" "there"))
              (list "hey" "hey" "hello" "hey"))

(define (substitute new old los)
  (cond
    [(empty? los) '()]
    [else
     (cons
      (cond
        [(string=? (first los) old) new]
        [else (first los)])
      (substitute new old (rest los)))]))
