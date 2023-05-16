#|
Author: Mark Beltran
Date: May 16, 2023

Delete ith element in provided string.
Reject empty strings.
|#

(define (string_delete str num)
  (if (or (empty? str) (>= num (string-length str)))
      (error "Invalid input!")
      (string-append
       (substring str 0 num)
       (substring str (+ num 1) (- (string-length str) 1)))))
              