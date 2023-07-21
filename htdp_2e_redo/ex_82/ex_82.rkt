#|
Author: Mark Beltran
Date: July 21, 2023

Exercise 82. Design the function compare-word. The function consumes two
three-letter words (see exercise 78). It produces a word that indicates where
the given ones agree and disagree. The function retains the
content of the structure fields if the two agree; otherwise it places #false
in the field of the resulting word. Hint The exercises mentions two tasks:
the comparison of words and the comparison of “letters.”
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Letter is one of:
; "a" to "z"
; "A" to "Z"

; A Result is one of:
; #false
; Letter

(define-struct test_word [ltr1 ltr2 ltr3])
; (make-test_word Letter Letter Letter)
; Interp.: (make-test_word "h" "e" "y"), represents a three-letter word

(define-struct result_word [res1 res2 res3])
; (make-result_word Result Result Result)
; Interp.: (make-test_word "h" #false "y"), contains the result of comparing
; each letter of two test_words. A field will contain #false if the two
; test_words contain different Letters in the same field,
; and the Letter otherwise.

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Test_word Test_word -> Result_word
; Produces a Result_word which indicates where the Test_words w1 & w2 agree
; or disagree.
(check-expect (compare_word (make-test_word "w" "o" "w")
                            (make-test_word "w" "o" "w"))
              (make-result_word "w" "o" "w"))
(check-expect (compare_word (make-test_word "h" "e" "y")
                            (make-test_word "h" "o" "y"))
              (make-result_word "h" #false "y"))
(check-expect (compare_word (make-test_word "a" "b" "c")
                            (make-test_word "d" "e" "f"))
              (make-result_word #false #false #false))

(define (compare_word w1 w2)
  (make-result_word
   (if (string=? (test_word-ltr1 w1) (test_word-ltr1 w2))
       (test_word-ltr1 w1)
       #false)
   (if (string=? (test_word-ltr2 w1) (test_word-ltr2 w2))
       (test_word-ltr2 w1)
       #false)
   (if (string=? (test_word-ltr3 w1) (test_word-ltr3 w2))
       (test_word-ltr3 w1)
       #false)))
