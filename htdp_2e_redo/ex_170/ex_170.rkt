#|
Author: Mark Beltran
Date: August 3, 2023

Exercise 170. Here is one way to represent a phone number:

(define-struct phone [area switch four])
; A Phone is a structure:
; (make-phone Three Three Four)
; A Three is a Number between 100 and 999.
; A Four is a Number between 1000 and 9999.

Design the function replace. It consumes and produces a list of Phones.
It replaces all occurrence of area code 713 with 281.
|#

(define-struct phone [area switch four])
; A Phone is a structure:
; (make-phone Three Three Four)
; A Three is a Number between 100 and 999.
; A Four is a Number between 1000 and 9999.

; List-of-phone -> List-of-phone
; Replaces all occurrence of area code 713 with 281
(check-expect (replace '()) '())
(check-expect (replace (list (make-phone 713 100 1000)
                             (make-phone 101 400 5000)))
              (list (make-phone 281 100 1000)
                    (make-phone 101 400 5000)))

(define (replace lop)
  (cond
    [(empty? lop) '()]
    [else
     (cons
      (make-phone
       (if (= (phone-area (first lop)) 713)
           281
           (phone-area (first lop)))
       (phone-switch (first lop))
       (phone-four (first lop)))
      (replace (rest lop)))]))
