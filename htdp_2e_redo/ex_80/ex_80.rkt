#|
Author: Mark Beltran
Date: July 21, 2023

Exercise 80. Create templates for functions that consume instances of
the following structure types:
|#

(define-struct movie [title director year])
(define-struct pet [name number])
(define-struct CD [artist title price])
(define-struct sweater [material size color])

; Movie -> Movie
(define (movie_filter m)
  (make-movie
   (...(movie-title m)...
       (movie-director m)...
       (movie-year m)...)))

; Pet -> String
(define (get_pet_name p)
  (...(pet-name p)...
      (pet-number p)...))

; CD -> Number
(define (get_price cd)
  (...(CD-artist cd)...
      (CD-title cd)...
      (CD-price cd)...))

; Sweater -> String
(define (get_size sw)
  (...(sweater-material sw)...
      (sweater-size sw)...
      (swaeter-color sw)...))
