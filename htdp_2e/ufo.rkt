(require 2htdp/image)
(require 2htdp/universe)

;position
(define WIDTH 200)
(define HEIGHT 400)
(define MIDDLE
  (/ WIDTH 2))

;objects in the scene
(define UFO
  (overlay
   (circle 10 "solid" "green")
   (rectangle 40 4 "solid" "green")))
(define ROCK
  (rectangle WIDTH 10 "solid" "brown"))

(define LIMIT
  (- HEIGHT
     (+ (/ (image-height UFO)
           2)
        (image-height ROCK))))
(define ROCK-XPOS
  (- HEIGHT
     (/ (image-height ROCK)
        2)))

;function definition/s
(define (moving_dot h)
  (cond
    [(<= h LIMIT)
     (place-images
      (list UFO ROCK)
      (list (make-posn MIDDLE h)
            (make-posn MIDDLE ROCK-XPOS))
      (empty-scene WIDTH HEIGHT "blue"))]
    [(> h LIMIT)
     (place-images
      (list UFO ROCK)
      (list (make-posn MIDDLE LIMIT)
            (make-posn MIDDLE ROCK-XPOS))
      (empty-scene WIDTH HEIGHT "blue"))]))

;main flow
(animate moving_dot)
