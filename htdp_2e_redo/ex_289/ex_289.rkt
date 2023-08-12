#|
Author: Mark Beltran
Date: August 12, 2023

Exercise 289. Use ormap to define find-name. The function consumes
a name and a list of names. It determines whether any of the names on the
latter are equal to or an extension of the former.

With andmap you can define a function that checks all names on a list
of names that start with the letter "a".

Should you use ormap or andmap to define a function that ensures that
no name on some list exceeds some given width?
|#

; String [List-of String] -> Boolean
; Checks if any of the names on the list of Strings provided are equal
; to or an extension of n
(check-expect (find-name "hi" '()) #false)
(check-expect (find-name "hi" (list "hi there" "hey")) #true)
(check-expect (find-name "hey" (list "hi" "hello" "there")) #false)

(define (find-name n ln)
  (ormap
   (lambda (str_from_lstr)
     (string-contains? n str_from_lstr))
   ln))

