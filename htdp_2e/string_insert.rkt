#|
Author: Mark Beltran
Date: May 16, 2023

Insert _ at selected index of string.
Reject if empty string.
|#

(define START 0)

(define (string_insert str num)
  (if (or (empty? str)
          (>= num (string-length str))
          (not (string? str)))
      (error "Invalid index number.")
      (string-append
       (substring str START num)
       "_"
       (substring str num (string-length str)))))
